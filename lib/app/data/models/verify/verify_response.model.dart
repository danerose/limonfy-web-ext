import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/data/models/user/user_account.model.dart';
import 'package:limonfy/app/data/models/user/user_profile.model.dart';
import 'package:limonfy/app/domain/entities/verify/verify_response.entity.dart';

class VerifyResponseModel extends Equatable {
  final int status;
  final String token;
  final UserAccountModel account;
  final UserProfileModel profile;
  final String channel;
  final String message;

  const VerifyResponseModel({
    required this.status,
    required this.token,
    required this.account,
    required this.profile,
    required this.channel,
    required this.message,
  });

  factory VerifyResponseModel.fromJson(Map<String, dynamic>? json) {
    return VerifyResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      token: ValidatorUtils.containsKey(json, 'token', ''),
      channel: ValidatorUtils.containsKey(json, 'channel', ''),
      account: UserAccountModel.fromJson(
        ValidatorUtils.containsKey(json, 'profile', null),
      ),
      profile: UserProfileModel.fromJson(
        ValidatorUtils.containsKey(json, 'profile', null),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  VerifyResponse toEntity() {
    return VerifyResponse(
      status: status,
      token: token,
      account: account.toEntity(),
      profile: profile.toEntity(),
      channel: channel,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
        account,
        profile,
        channel,
        message,
      ];
}
