import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixture/fixture_reader.dart';

class MockCreatedUser extends Mock implements CreatedUser {}

class MockGetUsers extends Mock implements GetUsers {}

void main() {
  late AuthenticationBloc bloc;
  late CreatedUser mockCreatedUser;
  late GetUsers mockGetUsers;
  const createdUserParams = CreatedUserParams(
    createdAt: 'createdAt',
    name: 'name',
    avatar: 'avatar',
  );
  const serverFailure = ServerFailure('Server error', statusCode: 500);

  final datas = (jsonDecode(fixture('users.json')) as List);
  final mockUsers = datas.map((userMap) => UserModel.fromMap(userMap)).toList();
  setUp(() {
    mockCreatedUser = MockCreatedUser();
    mockGetUsers = MockGetUsers();
    bloc =
        AuthenticationBloc(createUser: mockCreatedUser, getUsers: mockGetUsers);
    registerFallbackValue(createdUserParams);
  });

  tearDown(() => bloc.close());

  test('initial state should be [AuthenticationInitial]', () async {
    expect(bloc.state, const AuthenticationState.initial());
  });

  group('CreatedUserEvent', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits CreatingUser, UserCreated when createUser succeeds',
      build: () {
        when(() => mockCreatedUser(any()))
            .thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(const CreatedUserEvent(
        createdAt: '2023-12-26',
        name: 'Test User',
        avatar: 'avatar.png',
      )),
      expect: () => [
        const CreatingUser(),
        const UserCreated(),
      ],
      verify: (_) {
        verify(() => mockCreatedUser(any()));
        verifyNoMoreInteractions(mockCreatedUser);
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits CreatingUser, AuthenticationError when createUser fails',
      build: () {
        when(() => mockCreatedUser(any()))
            .thenAnswer((_) async => const Left(serverFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const CreatedUserEvent(
        createdAt: '2023-12-26',
        name: 'Test User',
        avatar: 'avatar.png',
      )),
      expect: () => [
        const CreatingUser(),
        AuthenticationState.error(message: serverFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => mockCreatedUser(any()));
        verifyNoMoreInteractions(mockCreatedUser);
      },
    );
  });

  group('GetUsersEvent', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits GettingUsers, UsersLoaded when getUsers succeeds',
      build: () {
        when(() => mockGetUsers()).thenAnswer((_) async => Right(mockUsers));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const GettingUsers(),
        AuthenticationState.usersLoaded(users: mockUsers),
      ],
      verify: (_) {
        verify(() => mockGetUsers());
        verifyNoMoreInteractions(mockGetUsers);
      },
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits GettingUsers, AuthenticationError when getUsers fails',
      build: () {
        when(() => mockGetUsers())
            .thenAnswer((_) async => const Left(serverFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const GettingUsers(),
        AuthenticationState.error(message: serverFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => mockGetUsers());
        verifyNoMoreInteractions(mockGetUsers);
      },
    );
  });
}
