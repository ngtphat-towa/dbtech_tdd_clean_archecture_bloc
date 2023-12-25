import 'package:equatable/equatable.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class CreateUser implements UseCaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _authenticationRepository;

  CreateUser(this._authenticationRepository);

  @override
  ResultVoid call(CreateUserParams params) =>
      _authenticationRepository.createUser(
        name: params.name,
        avatar: params.avatar,
        createdAt: params.createdAt,
      );
}

class CreateUserParams extends Equatable {
  final DateTime createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  CreateUserParams copyWith({
    DateTime? createdAt,
    String? name,
    String? avatar,
    String? id,
  }) {
    return CreateUserParams(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object> get props => [createdAt, name, avatar];
}
