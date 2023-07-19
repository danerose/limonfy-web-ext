import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

class UserProfileResponse extends Equatable {
  const UserProfileResponse({
    required this.status,
    required this.profile,
    required this.message,
  });

  final int status;
  final UserProfile profile;
  final String message;

  const UserProfileResponse.empty()
      : status = 0,
        profile = const UserProfile.empty(),
        message = '';

  @override
  List<Object?> get props => [status, profile, message];
}
