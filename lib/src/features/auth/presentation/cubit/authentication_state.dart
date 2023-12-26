part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  // Create User
  const factory AuthenticationState.creatingUser() = CreatingUser;
  const factory AuthenticationState.userCreated() = UserCreated;
  // Get User
  const factory AuthenticationState.gettingUsers() = GettingUsers;
  const factory AuthenticationState.usersLoaded({
    required List<UserEntity> users,
  }) = UserLoaded;
  // Auth state
  const factory AuthenticationState.error({required String message}) = AuthenticationStateError;
}
