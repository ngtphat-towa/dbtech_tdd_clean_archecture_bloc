import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  Future<List<UserModel>> getUsers();
}
