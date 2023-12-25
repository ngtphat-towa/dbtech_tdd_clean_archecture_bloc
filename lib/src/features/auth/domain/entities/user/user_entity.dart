import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;
  final String id;
  const UserEntity({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
  });

  factory UserEntity.empty() => const UserEntity(
        createdAt: '',
        name: '',
        avatar: '',
        id: '',
      );

  @override
  List<Object?> get props => [
        createdAt,
        name,
        avatar,
        id,
      ];
}
