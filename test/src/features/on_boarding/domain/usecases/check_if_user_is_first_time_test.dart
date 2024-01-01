// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/check_if_user_is_first_time.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_on_boarding_reopository.dart';

void main() {
  late CheckIfUserIsFirstTime usecase;
  late OnBoardingRepository mockRepository;

  setUp(() {
    mockRepository = MockOnBoardingRepository();
    usecase = CheckIfUserIsFirstTime(mockRepository);
  });

  group('Check if user is first time use case', () {
    test('Should return true if the user is first time', () async {
      // Arrange
      when(() => mockRepository.checkIfUserIsFirstTime()).thenAnswer(
        (_) async => const Right(true),
      ); // Assuming the user is first time

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const Right(true)));
      verify(() => mockRepository.checkIfUserIsFirstTime()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('Should return false if the user is not first time', () async {
      // Arrange
      when(() => mockRepository.checkIfUserIsFirstTime()).thenAnswer(
        (_) async => const Right(false),
      );

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(const Right(false)));
      verify(() => mockRepository.checkIfUserIsFirstTime()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('Should return a failure if an exception occurs', () async {
      // Arrange
      when(() => mockRepository.checkIfUserIsFirstTime()).thenAnswer(
        (_) async => Left(
          ServerFailure(
            message: 'Server error',
            statusCode: 500,
          ),
        ),
      );

      // Act
      final result = await usecase();

      // Assert
      expect(
        result,
        Left<Failure, dynamic>(
          ServerFailure(
            message: 'Server error',
            statusCode: 500,
          ),
        ),
      );
      verify(() => mockRepository.checkIfUserIsFirstTime()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
