import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usecases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/enum.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserParams> {
  UpdateUser(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultFuture<void> call(UpdateUserParams params) =>
      _authRepository.updateUser(
        action: params.updateUserAction,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.updateUserAction,
    required this.userData,
  });
  const UpdateUserParams.empty()
      : this(
          updateUserAction: UpdateUserAction.displayName,
          userData: '',
        );

  final UpdateUserAction updateUserAction;
  final dynamic userData;

  @override
  List<Object?> get props => [
        updateUserAction,
        userData,
      ];
}
