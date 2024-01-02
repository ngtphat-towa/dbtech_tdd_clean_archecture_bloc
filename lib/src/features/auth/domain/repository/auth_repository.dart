import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/enum.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/local_user.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultVoid signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultVoid forgetPassword(String email);

  ResultVoid updateUser({
    required UpdateUserAction action,
    dynamic userData,
  });
}
