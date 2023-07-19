import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.status = 0,
    this.profile = const UserProfile.empty(),
    this.loading = false,
  });

  final int status;
  final UserProfile profile;
  final bool loading;

  ProfileState copyWith({
    int? status,
    UserProfile? profile,
    bool? loading,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        status,
        profile,
        loading,
      ];
}
