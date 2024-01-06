import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockSignIn extends Mock implements SignIn {}

class MockSignUp extends Mock implements SignUp {}

class MockForgotPassword extends Mock implements ForgotPassword {}

class MockUpdateUser extends Mock implements UpdateUser {}

void main() {
  late SignIn signIn;
  late SignUp signUp;
  late ForgotPassword forgotPassword;
  late UpdateUser updateUser;
  late AuthBloc authBloc;

  const tEmail = 'example@example.com';
  const tPassword = 'password@';
  const tFullName = 'This is full name';
  const tAction = UpdateUserAction.displayName;
  const tUserData = 'This is user data';

  const tSignUpParams = SignUpParams(
    email: tEmail,
    password: tPassword,
    fullName: tFullName,
  );
  const tSignInParams = SignInParams(
    email: tEmail,
    password: tPassword,
  );
  const tUpdateUserParm = UpdateUserParams(
    action: tAction,
    userData: tUserData,
  );

  final tServerFailure =
      ServerFailure(message: 'Sign-in failed', statusCode: 500);

  const tLocalUser = LocalUser.empty();

  setUp(() {
    signIn = MockSignIn();
    signUp = MockSignUp();
    forgotPassword = MockForgotPassword();
    updateUser = MockUpdateUser();

    authBloc = AuthBloc(
      signIn: signIn,
      signUp: signUp,
      forgotPassword: forgotPassword,
      updateUser: updateUser,
    );
  });

  setUpAll(() {
    registerFallbackValue(tSignInParams);
    registerFallbackValue(tSignUpParams);
    registerFallbackValue(tUpdateUserParm);
  });
  tearDown(() => authBloc.close());

  test(
    'intial state should be [AuthIntial]',
    () => expect(
      authBloc.state,
      AuthInitial(),
    ),
  );
  group('signInEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, SignedIn] '
      'when signIn is called',
      build: () {
        when(() => signIn(any())).thenAnswer(
          (_) async => const Right(tLocalUser),
        );
        return authBloc;
      },
      act: (authBloc) => authBloc.add(
        const SignInEvent(
          email: tEmail,
          password: tPassword,
        ),
      ),
      expect: () => [
        AuthLoading(),
        const SignedIn(
          localUser: tLocalUser,
        ),
      ],
      verify: (_) {
        verify(() => signIn(any())).called(1);
        verifyNoMoreInteractions(signIn);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'Emits [AuthLoading, AuthError] when signIn fails',
      build: () {
        when(() => signIn(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(const SignInEvent(email: '', password: '')),
      expect: () => [
        AuthLoading(),
        AuthError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => signIn(any())).called(1);
        verifyNoMoreInteractions(signIn);
      },
    );
  });

  group('signUpEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, SignedUp] '
      'when signUp is called',
      build: () {
        when(() => signUp(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return authBloc;
      },
      act: (authBloc) => authBloc.add(
        const SignUpEvent(
          email: tEmail,
          password: tPassword,
          fullName: tFullName,
        ),
      ),
      expect: () => [
        AuthLoading(),
        SignedUp(),
      ],
      verify: (_) {
        verify(() => signUp(any())).called(1);
        verifyNoMoreInteractions(signUp);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'Emits [AuthLoading, AuthError] when signIn fails',
      build: () {
        when(() => signUp(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const SignUpEvent(
          email: '',
          password: '',
          fullName: '',
        ),
      ),
      expect: () => [
        AuthLoading(),
        AuthError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => signUp(any())).called(1);
        verifyNoMoreInteractions(signIn);
      },
    );
  });

  group('forgotPasswordEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, SignedUp] '
      'when forgotPasswordEvent is called',
      build: () {
        when(() => forgotPassword(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return authBloc;
      },
      act: (authBloc) => authBloc.add(
        const ForgotPasswordEvent(tEmail),
      ),
      expect: () => [
        AuthLoading(),
        ForgotPasswordSent(),
      ],
      verify: (_) {
        verify(() => forgotPassword(any())).called(1);
        verifyNoMoreInteractions(forgotPassword);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'Emits [AuthLoading, AuthError] when signIn fails',
      build: () {
        when(() => forgotPassword(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const ForgotPasswordEvent(tEmail),
      ),
      expect: () => [
        AuthLoading(),
        AuthError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => forgotPassword(any())).called(1);
        verifyNoMoreInteractions(forgotPassword);
      },
    );
  });

  group('userUpdatedEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, SignedUp] '
      'when forgotPasswordEvent is called',
      build: () {
        when(() => updateUser(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return authBloc;
      },
      act: (authBloc) => authBloc.add(
        const UpdateUserEvent(action: tAction, useData: tUserData),
      ),
      expect: () => [
        AuthLoading(),
        UserUpdated(),
      ],
      verify: (_) {
        verify(() => updateUser(any())).called(1);
        verifyNoMoreInteractions(updateUser);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'Emits [AuthLoading, AuthError] when signIn fails',
      build: () {
        when(() => updateUser(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const UpdateUserEvent(action: tAction, useData: tUserData),
      ),
      expect: () => [
        AuthLoading(),
        AuthError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => updateUser(any())).called(1);
        verifyNoMoreInteractions(updateUser);
      },
    );
  });
}
