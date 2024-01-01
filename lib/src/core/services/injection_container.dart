import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/datasources/on_boading_local_data_source.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/data/repository/on_boarding_repository_impl.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/repos/on_boarding_reopository.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/check_if_user_is_first_time.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  final pref = await SharedPreferences.getInstance();
  // Feature -> OnBoarding
  // Business Logic
  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTime: sl(),
      ),
    )
    ..registerLazySingleton(
      () => CacheFirstTimer(sl()),
    )
    ..registerLazySingleton(
      () => CheckIfUserIsFirstTime(sl()),
    )
    ..registerLazySingleton<OnBoardingRepository>(
      () => OnBoardingRepositoryImpl(sl()),
    )
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => pref);
}
