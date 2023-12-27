import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/data/data.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/domain.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/presentation/cubit/cubit.dart';

import '../../../../../fixture/fixture_reader.dart';

class MockCreatedUser extends Mock implements CreatedUser {}

class MockGetUsers extends Mock implements GetUsers {}

void main() {
  late AuthenticationCubit cubit;
  late CreatedUser mockCreatedUser;
  late GetUsers mockGetUsers;

  const createdUserParams = CreatedUserParams(
    createdAt: 'createdAt',
    name: 'name',
    avatar: 'avatar',
  );
  const serverFailure = ServerFailure('Server error', statusCode: 500);

  // Test success case
  final datas = (jsonDecode(fixture('users.json')) as List);
  final mockUsersList =
      datas.map((userMap) => UserModel.fromMap(userMap)).toList();
  setUp(() {
    mockCreatedUser = MockCreatedUser();
    mockGetUsers = MockGetUsers();
    cubit = AuthenticationCubit(
      createUser: mockCreatedUser,
      getUsers: mockGetUsers,
    );
    registerFallbackValue(createdUserParams);
  });

  tearDown(() => cubit.close());
  test('initial state should be [AuthenticationInitial]', () async {
    expect(cubit.state, const AuthenticationState.initial());
  });
  group('createUser', () {
    blocTest<AuthenticationCubit, AuthenticationState>(
      'should emit [CreatingUser, UserCreated] when createUser is added.',
      build: () {
        when(() => mockCreatedUser(any()))
            .thenAnswer((_) async => const Right(null));
        return cubit;
      },
      act: (cubit) => cubit.createdUser(
        createdAt: createdUserParams.createdAt,
        name: createdUserParams.name,
        avatar: createdUserParams.avatar,
      ),
      expect: () => const <AuthenticationState>[
        CreatingUser(),
        UserCreated(),
      ],
      verify: (_) {
        verify(
          () => mockCreatedUser(CreatedUserParams(
            createdAt: createdUserParams.createdAt,
            name: createdUserParams.name,
            avatar: createdUserParams.avatar,
          )),
        );
        verifyNoMoreInteractions(mockCreatedUser);
      },
    );
    blocTest<AuthenticationCubit, AuthenticationState>(
      'should emit [CreatingUser, AuthenticationError] when createUser is added.',
      build: () {
        when(() => mockCreatedUser(any()))
            .thenAnswer((_) async => const Left(serverFailure));
        return cubit;
      },
      act: (cubit) => cubit.createdUser(
        createdAt: createdUserParams.createdAt,
        name: createdUserParams.name,
        avatar: createdUserParams.avatar,
      ),
      expect: () => <AuthenticationState>[
        const CreatingUser(),
        AuthenticationState.error(message: serverFailure.errorMessage),
      ],
      verify: (_) {
        verify(
          () => mockCreatedUser(CreatedUserParams(
            createdAt: createdUserParams.createdAt,
            name: createdUserParams.name,
            avatar: createdUserParams.avatar,
          )),
        ).called(1);
        verifyNoMoreInteractions(mockCreatedUser);
      },
    );
  });
  group('getUsers', () {
    blocTest<AuthenticationCubit, AuthenticationState>(
      'should emit [GettingUsers, UsersLoaded] when getUsers succeeds',
      build: () {
        when(() => mockGetUsers())
            .thenAnswer((_) async => Right(mockUsersList));
        return cubit;
      },
      act: (cubit) => cubit.getUsers(),
      expect: () => [
        const AuthenticationState.gettingUsers(),
        AuthenticationState.usersLoaded(users: mockUsersList),
      ],
      verify: (_) {
        verify(() => mockGetUsers());
        verifyNoMoreInteractions(mockGetUsers);
      },
    );

    // Test failure case
    blocTest<AuthenticationCubit, AuthenticationState>(
      'should emit [GettingUsers, AuthenticationError] when getUsers fails',
      build: () {
        when(() => mockGetUsers())
            .thenAnswer((_) async => const Left(serverFailure));
        return cubit;
      },
      act: (cubit) => cubit.getUsers(),
      expect: () => [
        const AuthenticationState.gettingUsers(),
        AuthenticationState.error(message: serverFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => mockGetUsers());
        verifyNoMoreInteractions(mockGetUsers);
      },
    );
  });
}
