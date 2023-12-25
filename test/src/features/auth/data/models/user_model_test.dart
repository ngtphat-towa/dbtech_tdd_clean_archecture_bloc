import 'dart:convert';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/data/models/user_model.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/user/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture_reader.dart';

void main() {
  group('UserModel', () {
    const userModel = UserModel(
      createdAt: "2023-12-22T16:44:25.355Z",
      name: "Vera Mertz",
      avatar:
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/639.jpg",
      id: "1",
    );
    test('UserModel is an instance of UserEntity', () {
      expect(userModel, isA<UserEntity>());
    });

    test('fromMap should create a valid UserModel', () {
      final map = {
        "createdAt": "2023-12-22T16:44:25.355Z",
        "name": "Vera Mertz",
        "avatar":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/639.jpg",
        "id": "1"
      };
      final userModel = UserModel.fromMap(map);

      expect(userModel.createdAt, map['createdAt'] as String);
      expect(userModel.name, map['name'] as String);
      expect(userModel.avatar, map['avatar'] as String);
      expect(userModel.id, map['id'] as String);
    });
    test('toMap should create a valid Map representation', () {
      const userModel = UserModel(
        createdAt: '2023-12-22T16:44:25.355Z',
        name: 'John Doe',
        avatar: 'https://example.com/avatar.png',
        id: '123',
      );

      final expectedMap = {
        'createdAt': '2023-12-22T16:44:25.355Z',
        'name': 'John Doe',
        'avatar': 'https://example.com/avatar.png',
        'id': '123',
      };

      expect(userModel.toMap(), expectedMap);
    });

    test('toJson should create a valid JSON string', () {
      final jsonString = userModel.toJson();

      final decodedMap = jsonDecode(jsonString) as DataMap;
      expect(decodedMap['createdAt'], userModel.createdAt);
      expect(decodedMap['name'], userModel.name);
      expect(decodedMap['avatar'], userModel.avatar);
      expect(decodedMap['id'], userModel.id);
    });

    test('fromJson should create a valid UserModel from fixture JSON',
        () async {
      final jsonString = fixture('user.json');
      final userModel = UserModel.fromJson(jsonString);

      expect(userModel.createdAt, '2023-12-22T16:44:25.355Z');
      expect(userModel.name, 'Vera Mertz');
      expect(userModel.avatar,
          'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/639.jpg');
      expect(userModel.id, '1');
    });
    test('copyWith should create a new UserModel with updated values', () {
      const originalUserModel = UserModel(
        createdAt: '2023-12-22T16:44:25.355Z',
        name: 'John Doe',
        avatar: 'https://example.com/avatar.png',
        id: '123',
      );
      final updatedUserModel = originalUserModel.copyWith(
        name: 'Jane Doe',
        avatar: 'https://example.com/new-avatar.png',
      );

      expect(updatedUserModel.createdAt, originalUserModel.createdAt);
      expect(updatedUserModel.name, 'Jane Doe');
      expect(updatedUserModel.avatar, 'https://example.com/new-avatar.png');
      expect(updatedUserModel.id, originalUserModel.id);
    });
  });
}
