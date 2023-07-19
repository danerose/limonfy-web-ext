import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String userName;
  final String displayName;
  final String profileImage;
  final String phoneCode;
  final String phoneNumber;

  const UserProfile({
    required this.id,
    required this.userName,
    required this.displayName,
    required this.profileImage,
    required this.phoneCode,
    required this.phoneNumber,
  });

  UserProfile copyWith({
    String? id,
    String? userName,
    String? displayName,
    String? profileImage,
    String? phoneCode,
    String? phoneNumber,
  }) {
    return UserProfile(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      displayName: displayName ?? this.displayName,
      profileImage: profileImage ?? this.profileImage,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  const UserProfile.empty()
      : id = '',
        userName = '',
        displayName = '',
        profileImage = '',
        phoneCode = '',
        phoneNumber = '';

  @override
  List<Object?> get props => [
        id,
        userName,
        displayName,
        profileImage,
        phoneCode,
        phoneNumber,
      ];
}
