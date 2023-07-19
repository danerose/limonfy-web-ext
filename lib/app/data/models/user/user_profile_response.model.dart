import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/data/models/user/user_profile.model.dart';
import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';

class UserProfileResponseModel extends Equatable {
  final int status;
  final UserProfileModel profile;
  final String message;
  const UserProfileResponseModel({
    required this.status,
    required this.profile,
    required this.message,
  });

  factory UserProfileResponseModel.fromJson(Map<String, dynamic>? json) {
    return UserProfileResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      profile: UserProfileModel.fromJson(
        ValidatorUtils.containsKey(json, 'profile', null),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  UserProfileResponse toEntity() {
    return UserProfileResponse(
      status: status,
      profile: profile.toEntity(),
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, profile, message];
}
