// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdAt, String name, String avatar)
        createUser,
    required TResult Function() getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdAt, String name, String avatar)? createUser,
    TResult? Function()? getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdAt, String name, String avatar)? createUser,
    TResult Function()? getUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatedUserEvent value) createUser,
    required TResult Function(GetUsersEvent value) getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatedUserEvent value)? createUser,
    TResult? Function(GetUsersEvent value)? getUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatedUserEvent value)? createUser,
    TResult Function(GetUsersEvent value)? getUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreatedUserEventImplCopyWith<$Res> {
  factory _$$CreatedUserEventImplCopyWith(_$CreatedUserEventImpl value,
          $Res Function(_$CreatedUserEventImpl) then) =
      __$$CreatedUserEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String createdAt, String name, String avatar});
}

/// @nodoc
class __$$CreatedUserEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CreatedUserEventImpl>
    implements _$$CreatedUserEventImplCopyWith<$Res> {
  __$$CreatedUserEventImplCopyWithImpl(_$CreatedUserEventImpl _value,
      $Res Function(_$CreatedUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$CreatedUserEventImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreatedUserEventImpl implements CreatedUserEvent {
  const _$CreatedUserEventImpl(
      {required this.createdAt, required this.name, required this.avatar});

  @override
  final String createdAt;
  @override
  final String name;
  @override
  final String avatar;

  @override
  String toString() {
    return 'AuthEvent.createUser(createdAt: $createdAt, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedUserEventImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createdAt, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedUserEventImplCopyWith<_$CreatedUserEventImpl> get copyWith =>
      __$$CreatedUserEventImplCopyWithImpl<_$CreatedUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdAt, String name, String avatar)
        createUser,
    required TResult Function() getUsers,
  }) {
    return createUser(createdAt, name, avatar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdAt, String name, String avatar)? createUser,
    TResult? Function()? getUsers,
  }) {
    return createUser?.call(createdAt, name, avatar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdAt, String name, String avatar)? createUser,
    TResult Function()? getUsers,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(createdAt, name, avatar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatedUserEvent value) createUser,
    required TResult Function(GetUsersEvent value) getUsers,
  }) {
    return createUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatedUserEvent value)? createUser,
    TResult? Function(GetUsersEvent value)? getUsers,
  }) {
    return createUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatedUserEvent value)? createUser,
    TResult Function(GetUsersEvent value)? getUsers,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(this);
    }
    return orElse();
  }
}

abstract class CreatedUserEvent implements AuthenticationEvent {
  const factory CreatedUserEvent(
      {required final String createdAt,
      required final String name,
      required final String avatar}) = _$CreatedUserEventImpl;

  String get createdAt;
  String get name;
  String get avatar;
  @JsonKey(ignore: true)
  _$$CreatedUserEventImplCopyWith<_$CreatedUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUsersEventImplCopyWith<$Res> {
  factory _$$GetUsersEventImplCopyWith(
          _$GetUsersEventImpl value, $Res Function(_$GetUsersEventImpl) then) =
      __$$GetUsersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUsersEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetUsersEventImpl>
    implements _$$GetUsersEventImplCopyWith<$Res> {
  __$$GetUsersEventImplCopyWithImpl(
      _$GetUsersEventImpl _value, $Res Function(_$GetUsersEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUsersEventImpl implements GetUsersEvent {
  const _$GetUsersEventImpl();

  @override
  String toString() {
    return 'AuthEvent.getUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUsersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String createdAt, String name, String avatar)
        createUser,
    required TResult Function() getUsers,
  }) {
    return getUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String createdAt, String name, String avatar)? createUser,
    TResult? Function()? getUsers,
  }) {
    return getUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String createdAt, String name, String avatar)? createUser,
    TResult Function()? getUsers,
    required TResult orElse(),
  }) {
    if (getUsers != null) {
      return getUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatedUserEvent value) createUser,
    required TResult Function(GetUsersEvent value) getUsers,
  }) {
    return getUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatedUserEvent value)? createUser,
    TResult? Function(GetUsersEvent value)? getUsers,
  }) {
    return getUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatedUserEvent value)? createUser,
    TResult Function(GetUsersEvent value)? getUsers,
    required TResult orElse(),
  }) {
    if (getUsers != null) {
      return getUsers(this);
    }
    return orElse();
  }
}

abstract class GetUsersEvent implements AuthenticationEvent {
  const factory GetUsersEvent() = _$GetUsersEventImpl;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CreatingUserImplCopyWith<$Res> {
  factory _$$CreatingUserImplCopyWith(
          _$CreatingUserImpl value, $Res Function(_$CreatingUserImpl) then) =
      __$$CreatingUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatingUserImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$CreatingUserImpl>
    implements _$$CreatingUserImplCopyWith<$Res> {
  __$$CreatingUserImplCopyWithImpl(
      _$CreatingUserImpl _value, $Res Function(_$CreatingUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreatingUserImpl implements CreatingUser {
  const _$CreatingUserImpl();

  @override
  String toString() {
    return 'AuthenticationState.creatingUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatingUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return creatingUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return creatingUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (creatingUser != null) {
      return creatingUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return creatingUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return creatingUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (creatingUser != null) {
      return creatingUser(this);
    }
    return orElse();
  }
}

abstract class CreatingUser implements AuthenticationState {
  const factory CreatingUser() = _$CreatingUserImpl;
}

/// @nodoc
abstract class _$$UserCreatedImplCopyWith<$Res> {
  factory _$$UserCreatedImplCopyWith(
          _$UserCreatedImpl value, $Res Function(_$UserCreatedImpl) then) =
      __$$UserCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserCreatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserCreatedImpl>
    implements _$$UserCreatedImplCopyWith<$Res> {
  __$$UserCreatedImplCopyWithImpl(
      _$UserCreatedImpl _value, $Res Function(_$UserCreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserCreatedImpl implements UserCreated {
  const _$UserCreatedImpl();

  @override
  String toString() {
    return 'AuthenticationState.userCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return userCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return userCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return userCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return userCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated(this);
    }
    return orElse();
  }
}

abstract class UserCreated implements AuthenticationState {
  const factory UserCreated() = _$UserCreatedImpl;
}

/// @nodoc
abstract class _$$GettingUsersImplCopyWith<$Res> {
  factory _$$GettingUsersImplCopyWith(
          _$GettingUsersImpl value, $Res Function(_$GettingUsersImpl) then) =
      __$$GettingUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GettingUsersImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$GettingUsersImpl>
    implements _$$GettingUsersImplCopyWith<$Res> {
  __$$GettingUsersImplCopyWithImpl(
      _$GettingUsersImpl _value, $Res Function(_$GettingUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GettingUsersImpl implements GettingUsers {
  const _$GettingUsersImpl();

  @override
  String toString() {
    return 'AuthenticationState.gettingUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GettingUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return gettingUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return gettingUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (gettingUsers != null) {
      return gettingUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return gettingUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return gettingUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (gettingUsers != null) {
      return gettingUsers(this);
    }
    return orElse();
  }
}

abstract class GettingUsers implements AuthenticationState {
  const factory GettingUsers() = _$GettingUsersImpl;
}

/// @nodoc
abstract class _$$UserLoadedImplCopyWith<$Res> {
  factory _$$UserLoadedImplCopyWith(
          _$UserLoadedImpl value, $Res Function(_$UserLoadedImpl) then) =
      __$$UserLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserEntity> users});
}

/// @nodoc
class __$$UserLoadedImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserLoadedImpl>
    implements _$$UserLoadedImplCopyWith<$Res> {
  __$$UserLoadedImplCopyWithImpl(
      _$UserLoadedImpl _value, $Res Function(_$UserLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UserLoadedImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ));
  }
}

/// @nodoc

class _$UserLoadedImpl implements UserLoaded {
  const _$UserLoadedImpl({required final List<UserEntity> users})
      : _users = users;

  final List<UserEntity> _users;
  @override
  List<UserEntity> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'AuthenticationState.usersLoaded(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoadedImplCopyWith<_$UserLoadedImpl> get copyWith =>
      __$$UserLoadedImplCopyWithImpl<_$UserLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return usersLoaded(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return usersLoaded?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (usersLoaded != null) {
      return usersLoaded(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return usersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return usersLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (usersLoaded != null) {
      return usersLoaded(this);
    }
    return orElse();
  }
}

abstract class UserLoaded implements AuthenticationState {
  const factory UserLoaded({required final List<UserEntity> users}) =
      _$UserLoadedImpl;

  List<UserEntity> get users;
  @JsonKey(ignore: true)
  _$$UserLoadedImplCopyWith<_$UserLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateErrorImplCopyWith<$Res> {
  factory _$$AuthStateErrorImplCopyWith(_$AuthStateErrorImpl value,
          $Res Function(_$AuthStateErrorImpl) then) =
      __$$AuthStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthStateErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthStateErrorImpl>
    implements _$$AuthStateErrorImplCopyWith<$Res> {
  __$$AuthStateErrorImplCopyWithImpl(
      _$AuthStateErrorImpl _value, $Res Function(_$AuthStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthStateErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateErrorImpl implements AuthStateError {
  const _$AuthStateErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      __$$AuthStateErrorImplCopyWithImpl<_$AuthStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() creatingUser,
    required TResult Function() userCreated,
    required TResult Function() gettingUsers,
    required TResult Function(List<UserEntity> users) usersLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? creatingUser,
    TResult? Function()? userCreated,
    TResult? Function()? gettingUsers,
    TResult? Function(List<UserEntity> users)? usersLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? creatingUser,
    TResult Function()? userCreated,
    TResult Function()? gettingUsers,
    TResult Function(List<UserEntity> users)? usersLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CreatingUser value) creatingUser,
    required TResult Function(UserCreated value) userCreated,
    required TResult Function(GettingUsers value) gettingUsers,
    required TResult Function(UserLoaded value) usersLoaded,
    required TResult Function(AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CreatingUser value)? creatingUser,
    TResult? Function(UserCreated value)? userCreated,
    TResult? Function(GettingUsers value)? gettingUsers,
    TResult? Function(UserLoaded value)? usersLoaded,
    TResult? Function(AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CreatingUser value)? creatingUser,
    TResult Function(UserCreated value)? userCreated,
    TResult Function(GettingUsers value)? gettingUsers,
    TResult Function(UserLoaded value)? usersLoaded,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthenticationState {
  const factory AuthStateError({required final String message}) =
      _$AuthStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
