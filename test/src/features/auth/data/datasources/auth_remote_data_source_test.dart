import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthClient extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {
  String _uid = 'Test uid';
  @override
  String get uid => _uid;

  set uid(String value) {
    if (_uid != value) _uid = value;
  }
}

class MockUserCredential extends Mock implements UserCredential {
  MockUserCredential([User? user]) : _user = user;
  User? _user;
  @override
  User? get user => _user;

  set user(User? value) {
    if (_user != value) _user = value;
  }
}

class MockAuthCredential extends Mock implements AuthCredential {}

void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late FirebaseAuth authClient;
  late FirebaseFirestore cloudStoreClient;
  late MockFirebaseStorage dbClient;

  late DocumentReference<DataMap> documentReference;
  late MockUser mockUser;
  late UserCredential mockUserCredential;

  // final map = jsonDecode(fixture('local_user.json')) as DataMap;
  const tUser = LocalUserModel.empty();

  setUp(() async {
    authClient = MockAuthClient();
    cloudStoreClient = FakeFirebaseFirestore();
    documentReference = cloudStoreClient.collection('users').doc();
    await documentReference.set(
      tUser.copyWith(uid: documentReference.id).toMap(),
    );

    dbClient = MockFirebaseStorage();

    mockUser = MockUser()..uid = documentReference.id;
    mockUserCredential = MockUserCredential(mockUser);

    dataSource = AuthRemoteDataSourceImpl(
      authClient: authClient,
      cloudStoreClient: cloudStoreClient,
      dbClient: dbClient,
    );

    when(() => authClient.currentUser).thenReturn(mockUser);
  });

  const tEmail = 'example@example.com';
  const tPassword = 'password@';
  const tFullName = 'This is full name';
  const errorMessage = 'user-not-found';
  const errorCode = 'user-not-found';

  final tFirebaseAuthException = FirebaseAuthException(
    code: errorCode,
    message: errorMessage,
  );

  group('forgotPassword', () {
    test('should complete successfully when no [Exception] thrown', () async {
      // Mocking the behavior of sendPasswordResetEmail method
      when(
        () => authClient.sendPasswordResetEmail(email: any(named: 'email')),
      ).thenAnswer((_) async => Future.value());

      // Call the method that triggers the password reset
      final call = dataSource.forgetPassword;

      // Verify that sendPasswordResetEmail was called with the specified email
      expect(call(tEmail), completes);
      verify(() => authClient.sendPasswordResetEmail(email: tEmail)).called(1);
      verifyNoMoreInteractions(authClient);
    });
    test('should throw ServerException when email not found', () async {
      // Mocking the behavior of sendPasswordResetEmail method
      // to throw a FirebaseAuthException
      when(() => authClient.sendPasswordResetEmail(email: any(named: 'email')))
          .thenThrow(
        tFirebaseAuthException,
      );

      // Expecting the forgetPassword method to throw a ServerException
      expect(
        () => dataSource.forgetPassword(tEmail),
        throwsA(
          isA<ServerException>().having(
            (e) => e.statusCode,
            'statusCode',
            errorCode,
          ),
        ),
      );

      // Verifying the interaction with authClient
      verify(() => authClient.sendPasswordResetEmail(email: tEmail)).called(1);
      verifyNoMoreInteractions(authClient);
    });
  });

  group('signUp', () {
    test('should complete successfully when no [Exception] is thrown',
        () async {
      when(
        () => authClient.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUserCredential);

      when(() => mockUserCredential.user?.updateDisplayName(any())).thenAnswer(
        (C) async => Future.value(),
      );
      when(() => mockUserCredential.user?.updatePhotoURL(any())).thenAnswer(
        (_) async => Future.value(),
      );

      final call = dataSource.signUp(
        email: tEmail,
        fullName: tFullName,
        password: tPassword,
      );

      expect(call, completes);
      verify(
        () => authClient.createUserWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);

      await untilCalled(
        () => mockUserCredential.user?.updateDisplayName(any()),
      );
      await untilCalled(
        () => mockUserCredential.user?.updatePhotoURL(any()),
      );

      verify(() => mockUserCredential.user?.updateDisplayName(tFullName))
          .called(1);
      verify(() => mockUserCredential.user?.updatePhotoURL(kDefaultAvatar))
          .called(1);
      verifyNoMoreInteractions(authClient);
    });
    test(
        'should throw [ServerException] when [FirebaseAuthException] is thrown',
        () async {
      when(
        () => authClient.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(tFirebaseAuthException);

      final call = dataSource.signUp;
      expect(
        () => call(
          email: tEmail,
          fullName: tFullName,
          password: tPassword,
        ),
        throwsA(isA<ServerException>()),
      );
      verify(
        () => authClient.createUserWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        ),
      ).called(1);
    });
  });

  group('signIn', () {
    test(
      'should return [LocalUserModel] when no [Exception] is thrown',
      () async {
        when(
          () => authClient.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => mockUserCredential);

        final result = await dataSource.signIn(
          email: tEmail,
          password: tPassword,
        );

        expect(result, isA<LocalUserModel>());
        expect(result.uid, mockUserCredential.user!.uid);
        expect(result.points, 0);

        // Verify interactions with authClient and other methods
        verify(
          () => authClient.signInWithEmailAndPassword(
            email: tEmail,
            password: tPassword,
          ),
        ).called(1);
      },
    );

    test('should throw ServerException when user is not found', () async {
      final emptyUserCredentail = MockUserCredential();
      const tInvalidEmail = '';
      // Mocking the behavior of signInWithEmailAndPassword method
      // to throw a FirebaseAuthException for user not found
      when(
        () => authClient.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => emptyUserCredentail);

      // Expecting the signIn method to throw a ServerException
      final callSignIn = dataSource.signIn;
      expect(
        () => callSignIn(email: tInvalidEmail, password: tPassword),
        throwsA(
          isA<ServerException>(),
        ),
      );

      // Verify interaction with authClient
      // final call = authClient.signInWithEmailAndPassword;
      verify(
        () => authClient.signInWithEmailAndPassword(
          email: tInvalidEmail,
          password: tPassword,
        ),
      ).called(1);
      verifyNoMoreInteractions(authClient);
      // TODO(Test-Datastore-Created): implement the test to create collection.
    });

    test('should throw ServerException on unexpected error', () async {
      // Mocking the behavior of signInWithEmailAndPassword method
      // to throw an unexpected error (other than FirebaseAuthException)
      const tInvalidEmail = '';

      when(
        () => authClient.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception('Unexpected error'));

      // Expecting the signIn method to throw a ServerException
      final callSignIn = dataSource.signIn;
      expect(
        () => callSignIn(email: tInvalidEmail, password: tPassword),
        throwsA(isA<ServerException>()),
      );

      // Verify interaction with authClient
      // final call = authClient.signInWithEmailAndPassword;
      verify(
        () => authClient.signInWithEmailAndPassword(
          email: tInvalidEmail,
          password: tPassword,
        ),
      ).called(1);
      verifyNoMoreInteractions(authClient);
      // TODO(Test-Datastore-Created): implement the test to create collection.
    });
  });
  group('updateUser', () {
    setUp(() {
      registerFallbackValue(MockAuthCredential());
    });
    test('should update the display name of the current user', () async {
      // Arrange
      const tDisplayName = 'New Display Name';

      when(() => mockUser.updateDisplayName(any())).thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await dataSource.updateUser(
        action: UpdateUserAction.displayName,
        userData: tDisplayName,
      );

      // Assert
      verify(() => mockUser.updateDisplayName(tDisplayName)).called(1);
      verifyNever(() => mockUser.updatePhotoURL(any()));
      verifyNever(() => mockUser.updateEmail(any()));
      verifyNever(() => mockUser.updatePassword(any()));

      // Veritfy the cloud storage
      final userData =
          await cloudStoreClient.collection('users').doc(mockUser.uid).get();

      expect(userData.data()!['fullName'], tDisplayName);
    });

    test('should update the email of the current user', () async {
      // Arrange
      const tNewEmail = 'New Email';

      when(() => mockUser.updateEmail(any())).thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await dataSource.updateUser(
        action: UpdateUserAction.email,
        userData: tNewEmail,
      );

      // Assert
      verify(() => mockUser.updateEmail(tNewEmail)).called(1);
      verifyNever(() => mockUser.updatePhotoURL(any()));
      verifyNever(() => mockUser.updateDisplayName(any()));
      verifyNever(() => mockUser.updatePassword(any()));

      // Veritfy the cloud storage
      final userData =
          await cloudStoreClient.collection('users').doc(mockUser.uid).get();

      expect(userData.data()!['email'], tNewEmail);
    });

    test('should update the bio of the current user', () async {
      // Arrange
      const tNewBio = 'This is new bio';

      when(() => mockUser.updateDisplayName(any())).thenAnswer(
        (_) async => Future.value(),
      );

      // Act
      await dataSource.updateUser(
        action: UpdateUserAction.bio,
        userData: tNewBio,
      );

      // Assert
      verifyNever(() => mockUser.updateDisplayName(any()));
      verifyNever(() => mockUser.updatePhotoURL(any()));
      verifyNever(() => mockUser.updateEmail(any()));
      verifyNever(() => mockUser.updatePassword(any()));

      // Veritfy the cloud storage
      final userData =
          await cloudStoreClient.collection('users').doc(mockUser.uid).get();

      expect(userData.data()!['bio'], tNewBio);
    });

    test(
      'should update user password successfully when no [Exception] is '
      'thrown',
      () async {
        // Arrange
        when(() => mockUser.updatePassword(any()))
            .thenAnswer((_) async => Future.value());
        when(() => mockUser.reauthenticateWithCredential(any()))
            .thenAnswer((_) async => mockUserCredential);
        when(() => mockUser.email).thenReturn(tEmail);

        // Act
        await dataSource.updateUser(
          action: UpdateUserAction.password,
          userData: jsonEncode({
            'oldPassword': 'oldPassword',
            'newPassword': tPassword,
          }),
        );
        verify(() => mockUser.updatePassword(tPassword));

        verifyNever(() => mockUser.updateDisplayName(any()));
        verifyNever(() => mockUser.updatePhotoURL(any()));
        verifyNever(() => mockUser.updateEmail(any()));

        // Veritfy the cloud storage: never save raw password
        final userData =
            await cloudStoreClient.collection('users').doc(mockUser.uid).get();

        expect(userData.data()!['password'], null);
      },
    );
  });
  test(
      'should update user profilePic successfully when no [Exception] is'
      ' thrown', () async {
    // Arrange
    final newProfilePic = File('assets/images/onBoarding_background.png');
    when(() => mockUser.updatePhotoURL(any())).thenAnswer(
      (_) async => Future.value(),
    );
    // Act
    await dataSource.updateUser(
      action: UpdateUserAction.profilePic,
      userData: newProfilePic,
    );
    verify(() => mockUser.updatePhotoURL(any())).called(1);
    verifyNever(() => mockUser.updateDisplayName(any()));
    verifyNever(() => mockUser.updatePassword(any()));
    verifyNever(() => mockUser.updateEmail(any()));

    expect(dbClient.storedDataMap.isEmpty, isTrue);

    final ref =
        dbClient.ref().child('profile_pics/${authClient.currentUser?.uid}');
    final photoUrl = await ref.getDownloadURL();

    // Veritfy the cloud storage: never save raw password
    final userData =
        await cloudStoreClient.collection('users').doc(mockUser.uid).get();

    expect(userData.data()!['profilePic'], photoUrl);
  });
}
