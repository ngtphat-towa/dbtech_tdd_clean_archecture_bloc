// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/usecases/forget_password.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late ForgotPassword forgotPassword;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    forgotPassword = ForgotPassword(mockAuthRepository);
  });

  test('should call AuthRepository.forgetPassword with the provided email',
      () async {
    // Arrange
    const email = 'test@example.com';

    // Stubbing the AuthRepository's forgetPassword method to return a success
    when(() => mockAuthRepository.forgetPassword(email))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await forgotPassword(email);

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockAuthRepository.forgetPassword(email)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return a failure when AuthRepository.forgetPassword fails',
      () async {
    // Arrange
    const email = 'test@example.com';
    final failure = CacheFailure(
      message: 'Failed to send forgot password request',
      statusCode: 500,
    );

    // Stubbing the AuthRepository's forgetPassword method to return a failure
    when(() => mockAuthRepository.forgetPassword(email))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await forgotPassword(email);

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockAuthRepository.forgetPassword(email)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
