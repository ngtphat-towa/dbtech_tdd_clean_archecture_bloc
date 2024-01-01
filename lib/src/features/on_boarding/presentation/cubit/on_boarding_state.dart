part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {}

final class CachingFirstTimer extends OnBoardingState {}

final class CheckingIfUserIsFirstTimer extends OnBoardingState {}

final class UserCached extends OnBoardingState {}

final class OnBoardingStatus extends OnBoardingState {
  const OnBoardingStatus({required this.isFirstTimer});

  final bool isFirstTimer;
  @override
  List<Object> get props => [isFirstTimer];
}

final class OnBoardingError extends OnBoardingState {
  const OnBoardingError({required this.message});

  final String message;
  @override
  List<Object> get props => [message];
}
