import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

class VerifyResponse extends Equatable {
  final int status;
  final String token;
  final UserAccount account;
  final UserProfile profile;
  final String channel;
  final String message;

  const VerifyResponse({
    required this.status,
    required this.token,
    required this.account,
    required this.profile,
    required this.channel,
    required this.message,
  });

  const VerifyResponse.emtpy()
      : status = 0,
        token = '',
        account = const UserAccount.empty(),
        profile = const UserProfile.empty(),
        channel = '',
        message = '';

  @override
  List<Object?> get props => [
        status,
        token,
        account,
        profile,
        channel,
        message,
      ];

  @override
  bool? get stringify => true;
}
