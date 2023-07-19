import 'package:hive_flutter/hive_flutter.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';

part 'user_account.dao.g.dart';

@HiveType(typeId: 3)
class UserAccountDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String authenticationMethodId;
  @HiveField(2)
  final String userProfileId;
  @HiveField(3)
  final String userSettingsId;
  @HiveField(4)
  final String subscriptionId;
  @HiveField(5)
  final String customerStripeId;
  @HiveField(6)
  final String email;
  @HiveField(7)
  final bool welcomed;
  @HiveField(8)
  final String updatedAt;
  @HiveField(9)
  final String createdAt;

  UserAccountDao({
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
}
