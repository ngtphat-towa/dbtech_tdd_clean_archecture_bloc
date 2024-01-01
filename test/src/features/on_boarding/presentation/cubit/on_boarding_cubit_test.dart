import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/errors/failure.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/cache_first_timer_usecase.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/domain/usecases/check_if_user_is_first_time.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfUserIsFirstTime extends Mock
    implements CheckIfUserIsFirstTime {}

void main() {
  late OnBoardingCubit onBoardingCubit;
  late MockCacheFirstTimer mockCacheFirstTimer;
  late MockCheckIfUserIsFirstTime mockCheckIfUserIsFirstTime;

  setUp(() {
    mockCacheFirstTimer = MockCacheFirstTimer();
    mockCheckIfUserIsFirstTime = MockCheckIfUserIsFirstTime();
    onBoardingCubit = OnBoardingCubit(
      cacheFirstTimer: mockCacheFirstTimer,
      checkIfUserIsFirstTime: mockCheckIfUserIsFirstTime,
    );
  });

  tearDown(() {
    onBoardingCubit.close();
  });

  group('OnBoardingCubit', () {
    const mockIsFirstTimer = true;

    test(
      'initial state should be [OnBoardingInitial]',
      () => expect(
        onBoardingCubit.state,
        OnBoardingInitial(),
      ),
    );
    group('loadOnBoardingStatus', () {
      blocTest<OnBoardingCubit, OnBoardingState>(
        'emits [CheckingIfUserIsFirstTimer, OnBoardingStatus] '
        'when loadOnBoardingStatus is called',
        build: () {
          when(() => mockCheckIfUserIsFirstTime())
              .thenAnswer((_) async => const Right(mockIsFirstTimer));
          return onBoardingCubit;
        },
        act: (cubit) => cubit.loadOnBoardingStatus(),
        expect: () => [
          CheckingIfUserIsFirstTimer(),
          const OnBoardingStatus(isFirstTimer: mockIsFirstTimer),
        ],
        verify: (_) {
          verify(() => mockCheckIfUserIsFirstTime()).called(1);
          verifyNoMoreInteractions(mockCheckIfUserIsFirstTime);
        },
      );

      blocTest<OnBoardingCubit, OnBoardingState>(
        'emits [CheckingIfUserIsFirstTimer, OnBoardingError] '
        'when loadOnBoardingStatus fails',
        build: () {
          when(() => mockCheckIfUserIsFirstTime()).thenAnswer(
            (_) async => Left(
              ServerFailure(
                message: 'Server error',
                statusCode: 404,
              ),
            ),
          );
          return onBoardingCubit;
        },
        act: (cubit) => cubit.loadOnBoardingStatus(),
        expect: () => [
          CheckingIfUserIsFirstTimer(),
          const OnBoardingStatus(isFirstTimer: true),
        ],
        verify: (_) {
          verify(() => mockCheckIfUserIsFirstTime()).called(1);
          verifyNoMoreInteractions(mockCheckIfUserIsFirstTime);
        },
      );
    });

    group('cacheFirstTimer', () {
      blocTest<OnBoardingCubit, OnBoardingState>(
        'emits [CachingFirstTimer, UserCached] when cacheFirstTimer is called',
        build: () {
          when(() => mockCacheFirstTimer()).thenAnswer(
            (_) async => const Right(null),
          );
          return onBoardingCubit;
        },
        act: (cubit) => cubit.cacheFirstTimer(),
        expect: () => [
          CachingFirstTimer(),
          UserCached(),
        ],
        verify: (_) {
          verify(() => mockCacheFirstTimer()).called(1);
          verifyNoMoreInteractions(mockCacheFirstTimer);
        },
      );
      blocTest<OnBoardingCubit, OnBoardingState>(
        'emits [CachingFirstTimer, OnBoardingError] when cacheFirstTimer fails',
        build: () {
          when(() => mockCacheFirstTimer()).thenAnswer(
            (_) async => Left(
              CacheFailure(message: 'Cache failed', statusCode: 500),
            ),
          );
          return onBoardingCubit;
        },
        act: (cubit) => cubit.cacheFirstTimer(),
        expect: () => [
          CachingFirstTimer(),
          const OnBoardingError(message: 'Cache failed'),
        ],
        verify: (_) {
          verify(() => mockCacheFirstTimer()).called(1);
          verifyNoMoreInteractions(mockCacheFirstTimer);
        },
      );
    });
  });
}
