import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  sl.registerSingleton<http.Client>(
      http.Client()); // Register the HTTP client as a singleton

  // Dependencies (grouped for clarity)
  sl
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(sl()),
    )
    ..registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(sl()),
    )
    // Use cases
    ..registerLazySingleton<CreatedUser>(() => CreatedUser(sl()))
    ..registerLazySingleton<GetUsers>(() => GetUsers(sl()));

  // Controllers
  sl.registerFactory<AuthenticationCubit>(
    () => AuthenticationCubit(createUser: sl(), getUsers: sl()),
  );
}
