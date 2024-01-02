import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.points,
    required this.fullName,
    required this.groupIds,
    required this.enrolledCourseIds,
    required this.following,
    required this.follower,
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

  LocalUser copyWith({
    String? uid,
    String? email,
    String? profilePic,
    String? bio,
    int? points,
    String? fullName,
    List<String>? groupIds,
    List<String>? enrolledCourseIds,
    List<String>? following,
    List<String>? follower,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      points: points ?? this.points,
      fullName: fullName ?? this.fullName,
      groupIds: groupIds ?? this.groupIds,
      enrolledCourseIds: enrolledCourseIds ?? this.enrolledCourseIds,
      following: following ?? this.following,
      follower: follower ?? this.follower,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      uid,
      email,
    ];
  }

  @override
  String toString() => 'LocalUser(uid: $uid, email: $email, bio: $bio, '
      'points: $points, fullName: $fullName)';
}
