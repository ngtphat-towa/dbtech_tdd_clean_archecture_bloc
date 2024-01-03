import 'package:dbtech_tdd_clean_archecture_bloc/src/core/utils/typedef.dart';
import 'package:dbtech_tdd_clean_archecture_bloc/src/features/auth/auth.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uid,
    required super.email,
    required super.points,
    required super.fullName,
    super.groupIds,
    super.enrolledCourseIds,
    super.following,
    super.follower,
    super.profilePic,
    super.bio,
  });
  const LocalUserModel.empty()
      : this(
          uid: '',
          email: '',
          points: 0,
          fullName: '',
        );

  factory LocalUserModel.fromMap(DataMap map) => LocalUserModel(
        uid: map['uid'] as String,
        email: map['email'] as String,
        fullName: map['fullName'] as String,
        points: (map['points'] as num).toInt(),
        profilePic: map['profilePic'] as String?,
        bio: map['bio'] as String?,
        groupIds: (map['groupIds'] as List<dynamic>).cast<String>(),
        enrolledCourseIds:
            (map['enrolledCourseIds'] as List<dynamic>).cast<String>(),
        following: (map['following'] as List<dynamic>).cast<String>(),
        follower: (map['follower'] as List<dynamic>).cast<String>(),
      );

  DataMap toMap() => {
        'uid': uid,
        'email': email,
        'profilePic': profilePic,
        'bio': bio,
        'points': points,
        'fullName': fullName,
        'groupIds': List<dynamic>.from(groupIds.map((x) => x)),
        'enrolledCourseIds':
            List<dynamic>.from(enrolledCourseIds.map((x) => x)),
        'following': List<dynamic>.from(following.map((x) => x)),
        'follower': List<dynamic>.from(follower.map((x) => x)),
      };
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
}
