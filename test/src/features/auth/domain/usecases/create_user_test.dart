import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/errors.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthenticationRepository mockAuthenticationRepository;
  late CreatedUser createUser;
  const message = 'Unknown error occoured';
  const statusCode = 500;
  const serverException = ServerException(message, statusCode: statusCode);
  final serverFailure = ServerFailure.fromException(serverException);
  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    createUser = CreatedUser(mockAuthenticationRepository);
  });

  test('should call createUser with correct parameters on repository',
      () async {
    // Arrange
    const params = CreatedUserParams(
      createdAt: "2023-12-22T16:44:25.355Z",
      name: 'John Doe',
      avatar: 'https://example.com/avatar.png',
    );
    when(() => mockAuthenticationRepository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer((_) async => const Right(null));

    // Act
    final result = await createUser(params);

    // Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => mockAuthenticationRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ));
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('should return Right(null) when repository call is successful',
      () async {
    // Arrange
    const params = CreatedUserParams(
      createdAt: "2023-12-22T16:44:25.355Z",
      name: 'John Doe',
      avatar: 'https://example.com/avatar.png',
    );
    when(() => mockAuthenticationRepository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer((_) async => const Right(null));

    // Act
    final result = await createUser(params);

    // Assert
    expect(result, const Right(null));
  });

  test('should return Left when repository call fails', () async {
    // Arrange
    const params = CreatedUserParams(
      createdAt: "2023-12-22T16:44:25.355Z",
      name: 'John Doe',
      avatar: 'https://example.com/avatar.png',
    );
    when(() => mockAuthenticationRepository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer(((_) async => Left(serverFailure)));

    // Act
    final result = await createUser(params);

    // Assert
    expect(result, Left(serverFailure));
    verify(() => mockAuthenticationRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ));
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
