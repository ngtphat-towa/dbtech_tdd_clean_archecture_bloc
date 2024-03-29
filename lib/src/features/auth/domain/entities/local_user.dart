// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.points,
    required this.fullName,
    this.groupIds = const [],
    this.enrolledCourseIds = const [],
    this.following = const [],
    this.follower = const [],
    this.profilePic,
    this.bio,
  });
  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          points: 0,
          fullName: '',
          groupIds: const [],
          enrolledCourseIds: const [],
          following: const [],
          follower: const [],
          profilePic: '',
          bio: '',
        );
  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupIds;
  final List<String> enrolledCourseIds;
  final List<String> following;
  final List<String> follower;

  @override
  bool get stringify => true;

  @override
  String toString() => 'LocalUser(uid: $uid, email: $email, bio: $bio, '
      'points: $points, fullName: $fullName)';

  @override
  List<Object?> get props {
    return [
      uid,
      email,
      profilePic,
      bio,
      points,
      fullName,
      groupIds,
      enrolledCourseIds,
      following,
      follower,
    ];
  }
}
