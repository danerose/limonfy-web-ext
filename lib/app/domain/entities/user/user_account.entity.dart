import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  final String id;
  final String authenticationMethodId;
  final String userProfileId;
  final String userSettingsId;
  final String subscriptionId;
  final String customerStripeId;
  final String email;
  final bool welcomed;
  final String updatedAt;
  final String createdAt;

  const UserAccount({
    required this.id,
    required this.authenticationMethodId,
    required this.userProfileId,
    required this.userSettingsId,
    required this.subscriptionId,
    required this.customerStripeId,
    required this.email,
    required this.welcomed,
    required this.updatedAt,
    required this.createdAt,
  });

  const UserAccount.empty()
      : id = '',
        authenticationMethodId = '',
        userProfileId = '',
        userSettingsId = '',
        subscriptionId = '',
        customerStripeId = '',
        email = '',
        welcomed = false,
        updatedAt = '',
        createdAt = '';

  @override
  List<Object?> get props => [
        id,
        authenticationMethodId,
        userProfileId,
        userSettingsId,
        subscriptionId,
        customerStripeId,
        email,
        welcomed,
        updatedAt,
        createdAt,
      ];
}
