import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class GetUsers implements UseCaseWithNoParams<List<UserEntity>> {
  final AuthenticationRepository _authenticationRepository;

  GetUsers(this._authenticationRepository);

  @override
  ResultFuture<List<UserEntity>> call() => _authenticationRepository.getUsers();
}
