// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/src.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final CreatedUser _createdUser;
  final GetUsers _getUsers;

  AuthenticationBloc({
    required CreatedUser createUser,
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        _createdUser = createUser,
        super(const _Initial()) {
    on<CreatedUserEvent>(_createdUserEventHandler);
    on<GetUsersEvent>(_getUsersEventHandler);
  }

  Future<void> _createdUserEventHandler(
      CreatedUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(const CreatingUser());
    final result = await _createdUser(CreatedUserParams(
      createdAt: event.createdAt,
      name: event.name,
      avatar: event.name,
    ));
    result.fold(
      (Failure failure) {
        emit(AuthenticationState.error(
          message: failure.errorMessage,
        ));
      },
      (r) => emit(const UserCreated()),
    );
  }

  Future<void> _getUsersEventHandler(
      GetUsersEvent event, Emitter<AuthenticationState> emit) async {
    emit(const GettingUsers());
    final result = await _getUsers();
    result.fold(
      (Failure failure) {
        emit(AuthenticationState.error(
          message: failure.errorMessage,
        ));
      },
      (List<UserEntity> users) => emit(
        UserLoaded(users: users),
      ),
    );
  }
}
