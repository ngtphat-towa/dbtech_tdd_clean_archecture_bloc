import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required ForgotPassword forgotPassword,
    required UpdateUser updateUser,
  })  : _signIn = signIn,
        _signUp = signUp,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) => emit(AuthLoading()),
    );
    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    on<ForgotPasswordEvent>(_onForgotPasswordEvent);
    on<UpdateUserEvent>(_onUpdateUserEvent);
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // TODO(Validate-Value): Validate this user credential params
      // before call usecase
      final result = await _signIn(
        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );
      result.fold(
        (Failure failure) => emit(AuthError(message: failure.errorMessage)),
        (LocalUser user) => emit(SignedIn(localUser: user)),
      );
    } catch (e, s) {
      debugPrintStack(
        stackTrace: s,
        label: event.runtimeType.toString(),
      );
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // TODO(Validate-Value): Validate this user credential params
      // before call usecase
      final result = await _signUp(
        SignUpParams(
          email: event.email,
          password: event.password,
          fullName: event.fullName,
        ),
      );
      result.fold(
        (Failure failure) => emit(AuthError(message: failure.errorMessage)),
        (_) => emit(SignedUp()),
      );
    } catch (e, s) {
      debugPrintStack(
        stackTrace: s,
        label: event.runtimeType.toString(),
      );
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onForgotPasswordEvent(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // TODO(Validate-Value): Validate this user credential params
      // before call usecase
      final result = await _forgotPassword(event.email);
      result.fold(
        (Failure failure) => emit(AuthError(message: failure.errorMessage)),
        (_) => emit(ForgotPasswordSent()),
      );
    } catch (e, s) {
      debugPrintStack(
        stackTrace: s,
        label: event.runtimeType.toString(),
      );
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onUpdateUserEvent(
    UpdateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // TODO(Validate-Value): Validate this user credential params
      // before call usecase
      final result = await _updateUser(
        UpdateUserParams(
          action: event.action,
          userData: event.useData,
        ),
      );
      result.fold(
        (Failure failure) => emit(AuthError(message: failure.errorMessage)),
        (_) => emit(UserUpdated()),
      );
    } catch (e, s) {
      debugPrintStack(
        stackTrace: s,
        label: event.runtimeType.toString(),
      );
      emit(AuthError(message: e.toString()));
    }
  }
}
