// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/usecases/usecases.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UsecaseWithParams<void, SignUpParams> {
  const SignUp(this._authRepository);

  final AuthRepository _authRepository;

  @override
  ResultVoid call(SignUpParams params) => _authRepository.signUp(
        email: params.email,
        fullName: params.fullName,
        password: params.password,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });
  const SignUpParams.empty()
      : this(
          email: '',
          password: '',
          fullName: '',
        );

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object> get props => [email, password, fullName];
}
