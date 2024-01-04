// ignore_for_file: inference_failure_on_instance_creation

import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/enum.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/usecases/update_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late UpdateUser updateUser;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    updateUser = UpdateUser(mockAuthRepository);
  });

  test(
      'should call AuthRepository.updateUser with provided action and userData',
      () async {
    // Arrange
    const updateUserAction = UpdateUserAction.displayName;
    const userData = {'displayName': 'John Doe'};
    const updateUserParams = UpdateUserParams(
      action: updateUserAction,
      userData: userData,
    );

    // Stubbing the AuthRepository's updateUser
    // method to return success (Right(null))
    when(
      () => mockAuthRepository.updateUser(
        action: updateUserAction,
        userData: userData,
      ),
    ).thenAnswer((_) async => const Right(null));

    // Act
    final result = await updateUser(updateUserParams);

    // Assert
    expect(result, equals(const Right(null)));
    verify(
      () => mockAuthRepository.updateUser(
        action: updateUserAction,
        userData: userData,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return a failure when AuthRepository.updateUser fails',
      () async {
    // Arrange
    const updateUserAction = UpdateUserAction.displayName;
    const userData = {'displayName': 'John Doe'};
    const updateUserParams = UpdateUserParams(
      action: updateUserAction,
      userData: userData,
    );
    final failure = ServerFailure(
      message: 'Failed to update user',
      statusCode: 500,
    );

    // Stubbing the AuthRepository's updateUser method to return a failure
    when(
      () => mockAuthRepository.updateUser(
        action: updateUserAction,
        userData: userData,
      ),
    ).thenAnswer((_) async => Left(failure));

    // Act
    final result = await updateUser(updateUserParams);

    // Assert
    expect(result, equals(Left(failure)));
    verify(
      () => mockAuthRepository.updateUser(
        action: updateUserAction,
        userData: userData,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
