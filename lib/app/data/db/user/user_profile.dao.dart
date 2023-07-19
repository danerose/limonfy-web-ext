import 'package:hive_flutter/hive_flutter.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

part 'user_profile.dao.g.dart';

@HiveType(typeId: 4)
class UserProfileDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String displayName;
  @HiveField(3)
  final String profileImage;
  @HiveField(4)
  final String phoneCode;
  @HiveField(5)
  final String phoneNumber;

  UserProfileDao({
    required this.id,
    required this.userName,
    required this.displayName,
    required this.profileImage,
    required this.phoneCode,
    required this.phoneNumber,
  });

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      userName: userName,
      displayName: displayName,
      profileImage: profileImage,
      phoneCode: phoneCode,
      phoneNumber: phoneNumber,
    );
  }
}
