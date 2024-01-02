// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usecases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/local_user.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignIn extends UsecaseWithParams<LocalUser, SignInParams> {
  const SignIn(this._authRepository);

  final AuthRepository _authRepository;
  @override
  ResultFuture<LocalUser> call(SignInParams params) => _authRepository.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({required this.email, required this.password});
  const SignInParams.empty()
      : this(
          email: '',
          password: '',
        );

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
