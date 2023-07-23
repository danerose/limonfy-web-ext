import 'package:hive_flutter/hive_flutter.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription.entity.dart';

part 'subscription.dao.g.dart';

@HiveType(typeId: 5)
class SubscriptionDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String subscriptionItemId;
  @HiveField(2)
  final bool premium;
  @HiveField(3)
  final String expireAt;
  @HiveField(4)
  final String updatedAt;
  @HiveField(5)
  final String createdAt;

  SubscriptionDao({
    required this.id,
    required this.subscriptionItemId,
    required this.premium,
    required this.expireAt,
    required this.updatedAt,
    required this.createdAt,
  });

  Subscription toEntity() {
    return Subscription(
      id: id,
      subscriptionItemId: subscriptionItemId,
      premium: premium,
      expireAt: expireAt,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
