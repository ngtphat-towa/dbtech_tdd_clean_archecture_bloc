// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/usecases/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SignUp signUp;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUp = SignUp(mockAuthRepository);
  });

  test(
      'should call AuthRepository.signUp '
      'with provided email, fullName, and password', () async {
    // Arrange
    const email = 'test@example.com';
    const fullName = 'Test User';
    const password = 'password';
    const signUpParams = SignUpParams(
      email: email,
      fullName: fullName,
      password: password,
    );

    // Stubbing the AuthRepository's signUp method to return success Right(null)
    when(
      () => mockAuthRepository.signUp(
        email: email,
        fullName: fullName,
        password: password,
      ),
    ).thenAnswer((_) async => const Right(null));

    // Act
    final result = await signUp(signUpParams);

    // Assert
    expect(result, equals(const Right(null)));
    verify(
      () => mockAuthRepository.signUp(
        email: email,
        fullName: fullName,
        password: password,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return a failure when AuthRepository.signUp fails', () async {
    // Arrange
    const email = 'test@example.com';
    const fullName = 'Test User';
    const password = 'password';
    const signUpParams = SignUpParams(
      email: email,
      fullName: fullName,
      password: password,
    );
    final failure = ServerFailure(
      message: 'Failed to sign up',
      statusCode: 500,
    );

    // Stubbing the AuthRepository's signUp method to return a failure
    when(
      () => mockAuthRepository.signUp(
        email: email,
        fullName: fullName,
        password: password,
      ),
    ).thenAnswer((_) async => Left(failure));

    // Act
    final result = await signUp(signUpParams);

    // Assert
    expect(result, equals(Left(failure)));
    verify(
      () => mockAuthRepository.signUp(
        email: email,
        fullName: fullName,
        password: password,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
