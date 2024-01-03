import 'dart:convert';

import 'package:dbtech_tdd_clean_archecture_bloc/src/core/core.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/data/models/local_user_model.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/domain/entities/local_user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture_reader.dart';

void main() {
  final map = jsonDecode(fixture('local_user.json')) as DataMap;
  const tLocalUserModel = LocalUserModel(
    uid: '123',
    email: 'example@example.com',
    profilePic: 'example.jpg',
    bio: 'Sample bio',
    points: 100,
    fullName: 'John Doe',
    groupIds: ['group1', 'group2'],
    enrolledCourseIds: ['course1', 'course2'],
    following: ['user1', 'user2'],
    follower: ['user3', 'user4'],
  );
  const LocalUser tLocalUser = tLocalUserModel;

  group('LocalUserModel', () {
    test('UserModel is an instance of UserEntity', () {
      const localUser = LocalUserModel.empty();
      expect(localUser, isA<LocalUser>());
    });
    test('fromMap should create a valid LocalUserModel', () {
      final localUserModel = LocalUserModel.fromMap(map);

      // Check the model
      expect(localUserModel, equals(tLocalUser));

      //Check if that data was converted
      expect(localUserModel.uid, map['uid']);
      expect(localUserModel.email, map['email']);
      expect(localUserModel.profilePic, map['profilePic']);
      expect(localUserModel.bio, map['bio']);
      expect(localUserModel.points, map['points']);
      expect(localUserModel.fullName, map['fullName']);
      expect(
        localUserModel.groupIds,
        (map['groupIds']! as List<dynamic>).cast<String>(),
      );
      expect(
        localUserModel.enrolledCourseIds,
        (map['enrolledCourseIds']! as List<dynamic>).cast<String>(),
      );
      expect(
        localUserModel.following,
        (map['following']! as List<dynamic>).cast<String>(),
      );
      expect(
        localUserModel.follower,
        (map['follower']! as List<dynamic>).cast<String>(),
      );
    });

    test('toMap should create a valid Map representation', () {
      final expectedMap = {
        'uid': '123',
        'email': 'example@example.com',
        'profilePic': 'example.jpg',
        'bio': 'Sample bio',
        'points': 100,
        'fullName': 'John Doe',
        'groupIds': ['group1', 'group2'],
        'enrolledCourseIds': ['course1', 'course2'],
        'following': ['user1', 'user2'],
        'follower': ['user3', 'user4'],
      };

      expect(tLocalUserModel.toMap(), expectedMap);
    });

    test('copyWith should create a new LocalUserModel with updated values', () {
      const originalLocalUserModel = LocalUserModel(
        uid: '123',
        email: 'example@example.com',
        profilePic: 'example.jpg',
        bio: 'Sample bio',
        points: 100,
        fullName: 'John Doe',
        groupIds: ['group1', 'group2'],
        enrolledCourseIds: ['course1', 'course2'],
        following: ['user1', 'user2'],
        follower: ['user3', 'user4'],
      );
      final updatedLocalUserModel = originalLocalUserModel.copyWith(
        fullName: 'Jane Doe',
        bio: 'Updated bio',
      );

      expect(updatedLocalUserModel.uid, originalLocalUserModel.uid);
      expect(updatedLocalUserModel.email, originalLocalUserModel.email);
      expect(
        updatedLocalUserModel.profilePic,
        originalLocalUserModel.profilePic,
      );
      expect(updatedLocalUserModel.bio, 'Updated bio');
      expect(updatedLocalUserModel.points, originalLocalUserModel.points);
      expect(updatedLocalUserModel.fullName, 'Jane Doe');
      expect(updatedLocalUserModel.groupIds, originalLocalUserModel.groupIds);
      expect(
        updatedLocalUserModel.enrolledCourseIds,
        originalLocalUserModel.enrolledCourseIds,
      );
      expect(updatedLocalUserModel.following, originalLocalUserModel.following);
      expect(updatedLocalUserModel.follower, originalLocalUserModel.follower);
    });
  });
}
