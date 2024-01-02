// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/local_user.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/usecases/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignIn signIn;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signIn = SignIn(mockAuthRepository);
  });

  test('should call AuthRepository.signIn with provided email and password',
      () async {
    // Arrange
    const email = 'test@example.com';
    const password = 'password';
    const signInParams = SignInParams(email: email, password: password);
    const mockLocalUser = LocalUser(
      uid: '123',
      email: email,
      points: 100,
      fullName: 'Test User',
      groupIds: ['group1', 'group2'],
      enrolledCourseIds: ['course1', 'course2'],
      following: ['user1'],
      follower: ['user2'],
    );

    // Stubbing the AuthRepository's signIn method to return a local user
    when(() => mockAuthRepository.signIn(email: email, password: password))
        .thenAnswer((_) async => const Right(mockLocalUser));

    // Act
    final result = await signIn(signInParams);

    // Assert
    expect(result, equals(const Right(mockLocalUser)));
    verify(() => mockAuthRepository.signIn(email: email, password: password))
        .called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return a failure when AuthRepository.signIn fails', () async {
    // Arrange
    const email = 'test@example.com';
    const password = 'password';
    const signInParams = SignInParams(
      email: email,
      password: password,
    );
    final failure = ServerFailure(
      message: 'Failed to sign in',
      statusCode: 401,
    );

    // Stubbing the AuthRepository's signIn method to return a failure
    when(() => mockAuthRepository.signIn(email: email, password: password))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await signIn(signInParams);

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockAuthRepository.signIn(email: email, password: password))
        .called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
