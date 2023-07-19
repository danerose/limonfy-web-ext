import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';

class UserAccountModel extends Equatable {
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

  const UserAccountModel({
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

  factory UserAccountModel.fromJson(Map<String, dynamic>? json) {
    return UserAccountModel(
      id: ValidatorUtils.containsKey(json, '_id', ''),
      authenticationMethodId: ValidatorUtils.containsKey(
        json,
        'authentication_method_id',
        '',
      ),
      userProfileId: ValidatorUtils.containsKey(json, 'user_profile_id', ''),
      userSettingsId: ValidatorUtils.containsKey(json, 'user_settings_id', ''),
      subscriptionId: ValidatorUtils.containsKey(json, 'subcription_id', ''),
      customerStripeId: ValidatorUtils.containsKey(
        json,
        'customer_stripe_id',
        '',
      ),
      email: ValidatorUtils.containsKey(json, 'email', ''),
      welcomed: ValidatorUtils.containsKey<bool>(json, 'welcome', false),
      updatedAt: ValidatorUtils.containsKey(json, 'updated_at', ''),
      createdAt: ValidatorUtils.containsKey(json, 'created_at', ''),
    );
  }

  UserAccount toEntity() {
    return UserAccount(
      id: id,
      authenticationMethodId: authenticationMethodId,
      userProfileId: userProfileId,
      userSettingsId: userSettingsId,
      subscriptionId: subscriptionId,
      customerStripeId: customerStripeId,
      email: email,
      welcomed: welcomed,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }

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
