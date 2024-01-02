import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usecases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._authRepository);

  final AuthRepository _authRepository;
  @override
  ResultFuture<void> call(String params) =>
      _authRepository.forgetPassword(params);
}
