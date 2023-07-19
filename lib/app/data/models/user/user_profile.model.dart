import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

class UserProfileModel extends Equatable {
  final String id;
  final String userName;
  final String displayName;
  final String profileImage;
  final String phoneCode;
  final String phoneNumber;

  const UserProfileModel({
    required this.id,
    required this.userName,
    required this.displayName,
    required this.profileImage,
    required this.phoneCode,
    required this.phoneNumber,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic>? json) {
    return UserProfileModel(
      id: ValidatorUtils.containsKey(json, '_id', ''),
      userName: ValidatorUtils.containsKey(json, 'user_name', ''),
      displayName: ValidatorUtils.containsKey(json, 'display_name', ''),
      profileImage: ValidatorUtils.containsKey(json, 'profile_image', ''),
      phoneCode: ValidatorUtils.containsKey(json, 'phone_code', ''),
      phoneNumber: ValidatorUtils.containsKey(json, 'phone_number', ''),
    );
  }

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

  @override
  List<Object?> get props =>
      [id, userName, displayName, profileImage, phoneCode, phoneNumber];
}
