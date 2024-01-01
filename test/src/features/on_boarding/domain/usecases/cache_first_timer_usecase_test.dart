// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_on_boarding_reopository.dart';

void main() {
  late CacheFirstTimer usecase;
  late OnBoardingRepository mockRepository;

  setUp(() {
    mockRepository = MockOnBoardingRepository();
    usecase = CacheFirstTimer(mockRepository);
  });

  group('Cache first timer', () {
    test('Should cache first timer successfully', () async {
      // Arrange
      when(() => mockRepository.cacheFirstTimer()).thenAnswer(
        (_) async => const Right(null),
      ); // Assuming caching is successful

      // Act
      final result = await usecase(); // Call the use case

      // Assert
      expect(result, equals(const Right(null)));
      verify(() => mockRepository.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('Should return a failure if caching fails', () async {
      // Arrange
      when(() => mockRepository.cacheFirstTimer()).thenAnswer(
        (_) async => Left(
          CacheFailure(
            message: 'Failed',
            statusCode: 500,
          ),
        ),
      ); // Assuming caching fails

      // Act
      final result = await usecase(); // Call the use case

      // Assert
      expect(
        result,
        Left(
          CacheFailure(
            message: 'Failed',
            statusCode: 500,
          ),
        ),
      ); // Check if the result is as expected
      verify(() => mockRepository.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
