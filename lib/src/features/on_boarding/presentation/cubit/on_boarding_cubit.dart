import 'package:bloc/bloc.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/check_if_user_is_first_time.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserIsFirstTime checkIfUserIsFirstTime,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTime = checkIfUserIsFirstTime,
        super(OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTime _checkIfUserIsFirstTime;

  Future<void> loadOnBoardingStatus() async {
    emit(CheckingIfUserIsFirstTimer());
    final result = await _checkIfUserIsFirstTime();
    result.fold(
      (failure) => emit(const OnBoardingStatus(isFirstTimer: true)),
      (isFirstTimer) => emit(OnBoardingStatus(isFirstTimer: isFirstTimer)),
    );
  }

  Future<void> cacheFirstTimer() async {
    emit(CachingFirstTimer());
    final result = await _cacheFirstTimer();
    result.fold(
      (failure) => emit(OnBoardingError(message: failure.message)),
      (_) => emit(UserCached()),
    );
  }
}
