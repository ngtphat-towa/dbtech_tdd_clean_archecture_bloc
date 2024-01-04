part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class SignedIn extends AuthState {
  const SignedIn({required this.localUser});

  final LocalUser localUser;

  @override
  List<Object> get props => [localUser];
}

final class SignedUp extends AuthState {}

final class ForgotPasswordSent extends AuthState {}

final class UserUpdated extends AuthState {}

final class AuthError extends AuthState {
  const AuthError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
