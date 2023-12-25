import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/errors.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthenticationRepository mockAuthenticationRepository;
  late CreateUser createUser;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    createUser = CreateUser(mockAuthenticationRepository);
  });

  test('should call createUser with correct parameters on repository',
      () async {
    // Arrange
    final params = CreateUserParams(
      createdAt: DateTime.now(),
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
    final params = CreateUserParams(
      createdAt: DateTime.now(),
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
    final params = CreateUserParams(
      createdAt: DateTime.now(),
      name: 'John Doe',
      avatar: 'https://example.com/avatar.png',
    );
    const failure =
        ServerFailure('404', 404); 
    when(() => mockAuthenticationRepository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer((_) async => const Left(failure));

    // Act
    final result = await createUser(params);

    // Assert
    expect(result, const Left(failure));
    verify(() => mockAuthenticationRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        ));
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
