import 'package:dbtech_tdd_clean_archecture_bloc/src/src.dart';

abstract class AuthenticationRepository {
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  ResultFuture<List<UserEntity>> getUsers();
}
