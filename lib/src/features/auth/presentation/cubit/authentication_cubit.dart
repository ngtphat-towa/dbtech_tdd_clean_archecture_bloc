import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final CreatedUser _createdUser;
  final GetUsers _getUsers;
  AuthenticationCubit({
    required CreatedUser createUser,
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        _createdUser = createUser,
        super(const AuthenticationState.initial());

  Future<void> createdUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    emit(const AuthenticationState.creatingUser());
    final result = await _createdUser(CreatedUserParams(
      createdAt: createdAt,
      name: name,
      avatar: name,
    ));
    result.fold(
      (Failure failure) {
        emit(AuthenticationState.error(
          message: failure.errorMessage,
        ));
      },
      (r) => emit(const AuthenticationState.userCreated()),
    );
  }

  Future<void> getUsers() async {
    emit(const AuthenticationState.gettingUsers());
    final result = await _getUsers();
    result.fold(
      (Failure failure) {
        emit(AuthenticationState.error(
          message: failure.errorMessage,
        ));
      },
      (List<UserEntity> users) => emit(
        AuthenticationState.usersLoaded(users: users),
      ),
    );
  }
}
