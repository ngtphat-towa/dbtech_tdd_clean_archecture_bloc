import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // * Core
  sl.registerSingleton(http.Client());
  // * Dependencies
  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(sl()),
  );
  // Repositories
  sl.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(sl()),
  );
  // * UseCases
  sl.registerLazySingleton<CreatedUser>(() => CreatedUser(sl()));
  sl.registerLazySingleton<GetUsers>(() => GetUsers(sl()));
  // * Controllers
  sl.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(createUser: sl(), getUsers: sl()),
  );
}
