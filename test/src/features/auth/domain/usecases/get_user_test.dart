import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthenticationRepository mockAuthenticationRepository;
  late GetUsers getUsers;
  List<UserEntity> users = [
    UserEntity.empty(),
    const UserEntity(
      id: '1',
      createdAt: "2023-12-22T16:44:25.355Z",
      name: 'John Doe',
      avatar: 'https://example.com/avatar.png',
    )
  ];
  const message = 'Unknown error occoured';
  const statusCode = 500;
  const serverException = ServerException(message, statusCode: statusCode);
  const serverFailure = ServerFailure(serverException);
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    getUsers = GetUsers(mockAuthenticationRepository);
  });

  test('should call getUsers on the repository', () async {
    // Arrange
    when(() => mockAuthenticationRepository.getUsers())
        .thenAnswer((_) async => const Right([]));

    // Act
    await getUsers();

    // Assert
    verify(() => mockAuthenticationRepository.getUsers());
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('should return Right(users) when repository call is successful',
      () async {
    // Arrange
    when(() => mockAuthenticationRepository.getUsers())
        .thenAnswer((_) async => Right(users));

    // Act
    final result = await getUsers();

    // Assert
    expect(result, Right(users));
  });

  test('should return Left(failure) when repository call fails', () async {
    // Arrange
    // Replace with appropriate failure type
    when(() => mockAuthenticationRepository.getUsers())
        .thenAnswer((_) async => const Left(serverFailure));

    // Act
    final result = await getUsers();

    // Assert
    expect(result, const Left(serverFailure));
  });

  //TODO: Add more tests for specific failure cases if needed, e.g.,
  // - UnauthorizedFailure
  // - CacheFailure
  // - ConnectivityFailure
}
