// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/exception.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/datasources/on_boading_local_data_source.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/repository/on_boarding_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSource extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingRepositoryImpl repository;
  late OnBoardingLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockOnBoardingLocalDataSource();
    repository = OnBoardingRepositoryImpl(mockLocalDataSource);
  });

  group('cacheFirstTimer', () {
    test('should cache first timer successfully', () async {
      // Arrange
      when(() => mockLocalDataSource.cacheFirstTimer())
          .thenAnswer((_) async {});

      // Act
      final result = await repository.cacheFirstTimer();

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockLocalDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return a failure when caching fails', () async {
      // Arrange
      when(() => mockLocalDataSource.cacheFirstTimer())
          .thenThrow(const CacheException(message: 'Failed'));

      // Act
      final result = await repository.cacheFirstTimer();

      // Assert
      expect(
        result,
        equals(
          Left(
            CacheFailure(
              message: 'Failed',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => mockLocalDataSource.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });

  group('checkIfUserIsFirstTime', () {
    test('should return true if user is considered first time', () async {
      // Arrange
      when(() => mockLocalDataSource.checkIfUserIsFirstTimer())
          .thenAnswer((_) async => true);

      // Act
      final result = await repository.checkIfUserIsFirstTime();

      // Assert
      expect(result, equals(const Right(true)));
      verify(() => mockLocalDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return a failure when checking user status fails', () async {
      // Arrange
      when(() => mockLocalDataSource.checkIfUserIsFirstTimer())
          .thenThrow(const CacheException(message: 'Failed'));

      // Act
      final result = await repository.checkIfUserIsFirstTime();

      // Assert
      expect(
        result,
        equals(
          Left(
            CacheFailure(
              message: 'Failed',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => mockLocalDataSource.checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });
  });
}
