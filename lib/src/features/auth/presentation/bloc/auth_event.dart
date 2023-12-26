part of 'auth_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthEvent {
  const factory AuthenticationEvent.createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) = CreatedUserEvent;
  const factory AuthenticationEvent.getUsers() = GetUsersEvent;
}
