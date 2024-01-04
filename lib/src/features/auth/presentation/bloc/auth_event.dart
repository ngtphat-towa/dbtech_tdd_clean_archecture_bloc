part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

final class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object> get props => [email, password, fullName];
}

final class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class UpdateUserEvent extends AuthEvent {
  const UpdateUserEvent({
    required this.action,
    required this.useData,
  }) : assert(
          useData is String || useData is File,
          'UserData must be either String or File',
        );

  final UpdateUserAction action;
  final Object useData;

  @override
  List<Object> get props => [action, useData];
}
