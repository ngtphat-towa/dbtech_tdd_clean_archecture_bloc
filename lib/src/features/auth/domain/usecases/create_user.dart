import 'package:equatable/equatable.dart';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class CreatedUser implements UseCaseWithParams<void, CreatedUserParams> {
  final AuthenticationRepository _authenticationRepository;

  CreatedUser(this._authenticationRepository);

  @override
  ResultVoid call(CreatedUserParams params) =>
      _authenticationRepository.createUser(
        name: params.name,
        createdAt: params.createdAt,
        avatar: params.avatar,
      );
}

class CreatedUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreatedUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  CreatedUserParams copyWith({
    String? createdAt,
    String? name,
    String? avatar,
    String? id,
  }) {
    return CreatedUserParams(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object> get props => [createdAt, name, avatar];
}
