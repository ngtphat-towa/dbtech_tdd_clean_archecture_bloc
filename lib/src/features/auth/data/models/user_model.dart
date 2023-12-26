import 'dart:convert';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.createdAt,
    required super.name,
    required super.avatar,
    required super.id,
  });
  static UserModel get empty => const UserModel(
        createdAt: 'empty.createAt',
        name: 'empty.name',
        avatar: 'empty.avatar',
        id: '1',
      );
  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      createdAt: map["createdAt"] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as DataMap);

  DataMap toMap() {
    return {
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
      'id': id,
    };
  }

  UserModel copyWith({
    String? createdAt,
    String? name,
    String? avatar,
    String? id,
  }) {
    return UserModel(
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
    );
  }
}
