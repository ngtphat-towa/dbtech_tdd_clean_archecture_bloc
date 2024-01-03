// ignore_for_file: inference_failure_on_instance_creation
// ignore_for_file: inference_failure_on_function_invocation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/enum.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRepositoryImpl repository;
  late AuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(remoteDataSource: mockRemoteDataSource);
    registerFallbackValue(UpdateUserAction.displayName);
  });
  group('forgetPassword', () {
    test('should return Right(null) when remote data source succeeds',
        () async {
      // Arrange
      when(() => mockRemoteDataSource.forgetPassword(any()))
          .thenAnswer((_) async {});

      // Act
      final result = await repository.forgetPassword('test@example.com');

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockRemoteDataSource.forgetPassword('test@example.com'))
          .called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Left(ServerFailure) when remote data source fails',
        () async {
      // Arrange
      when(() => mockRemoteDataSource.forgetPassword(any())).thenThrow(
        const ServerException(
          message: 'Server error',
          statusCode: '500',
        ),
      );

      // Act
      final result = await repository.forgetPassword('test@example.com');

      // Assert
      expect(
        result,
        equals(Left(ServerFailure(message: 'Server error', statusCode: '500'))),
      );
      verify(() => mockRemoteDataSource.forgetPassword('test@example.com'))
          .called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('signIn', () {
    test('should return Right(LocalUser) when remote data source succeeds',
        () async {
      // Arrange
      const mockUser = LocalUserModel.empty();
      when(
        () => mockRemoteDataSource.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => mockUser);

      // Act
      final result = await repository.signIn(
        email: 'test@example.com',
        password: 'password',
      );

      // Assert
      expect(result, equals(const Right(mockUser)));
      verify(
        () => mockRemoteDataSource.signIn(
          email: 'test@example.com',
          password: 'password',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Left(CacheFailure) when remote data source fails',
        () async {
      // Arrange
      when(
        () => mockRemoteDataSource.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        const CacheException(
          message: 'Cache error',
          // statusCode: 500,
        ),
      );

      // Act
      final result = await repository.signIn(
        email: 'test@example.com',
        password: 'password',
      );

      // Assert
      expect(
        result,
        equals(Left(CacheFailure(message: 'Cache error', statusCode: 500))),
      );
      verify(
        () => mockRemoteDataSource.signIn(
          email: 'test@example.com',
          password: 'password',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });

  group('signUp', () {
    test('should return Right(null) when remote data source succeeds',
        () async {
      // Arrange
      when(
        () => mockRemoteDataSource.signUp(
          email: any(named: 'email'),
          fullName: any(named: 'fullName'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});

      // Act
      final result = await repository.signUp(
        email: 'test@example.com',
        fullName: 'Test User',
        password: 'password',
      );

      // Assert
      expect(result, equals(const Right(null)));
      verify(
        () => mockRemoteDataSource.signUp(
          email: 'test@example.com',
          fullName: 'Test User',
          password: 'password',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Left(ServerFailure) when remote data source fails',
        () async {
      // Arrange
      when(
        () => mockRemoteDataSource.signUp(
          email: any(named: 'email'),
          fullName: any(named: 'fullName'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        const ServerException(
          message: 'Server error',
          statusCode: '500',
        ),
      );

      // Act
      final result = await repository.signUp(
        email: 'test@example.com',
        fullName: 'Test User',
        password: 'password',
      );

      // Assert
      expect(
        result,
        equals(Left(ServerFailure(message: 'Server error', statusCode: '500'))),
      );
      verify(
        () => mockRemoteDataSource.signUp(
          email: 'test@example.com',
          fullName: 'Test User',
          password: 'password',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    // ... add more tests for different scenarios
  });

  group('updateUser', () {
    test('should return Right(null) when remote data source succeeds',
        () async {
      // Arrange
      when(
        () => mockRemoteDataSource.updateUser(
          action: any(named: 'action'),
          userData: any(named: 'userData'),
        ),
      ).thenAnswer((_) async {});

      // Act
      final result = await repository.updateUser(
        action: UpdateUserAction.displayName,
        userData: 'New Display Name',
      );

      // Assert
      expect(result, equals(const Right(null)));
      verify(
        () => mockRemoteDataSource.updateUser(
          action: UpdateUserAction.displayName,
          userData: 'New Display Name',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Left(CacheFailure) when remote data source fails',
        () async {
      // Arrange
      when(
        () => mockRemoteDataSource.updateUser(
          action: any(named: 'action'),
          userData: any(named: 'userData'),
        ),
      ).thenThrow(
        const CacheException(
          message: 'Cache error',
        ),
      );

      // Act
      final result = await repository.updateUser(
        action: UpdateUserAction.displayName,
        userData: 'New Display Name',
      );

      // Assert
      expect(
        result,
        equals(Left(CacheFailure(message: 'Cache error', statusCode: 500))),
      );
      verify(
        () => mockRemoteDataSource.updateUser(
          action: UpdateUserAction.displayName,
          userData: 'New Display Name',
        ),
      ).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
