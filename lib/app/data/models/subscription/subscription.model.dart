import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription.entity.dart';

class SubscriptionModel extends Equatable {
  final String id;
  final String subscriptionItemId;
  final bool premium;
  final String expireAt;
  final String updatedAt;
  final String createdAt;

  const SubscriptionModel({
    required this.id,
    required this.subscriptionItemId,
    required this.premium,
    required this.expireAt,
    required this.updatedAt,
    required this.createdAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic>? sub) {
    return SubscriptionModel(
      id: ValidatorUtils.containsKey(sub, '_id', ''),
      subscriptionItemId: ValidatorUtils.containsKey(
        sub,
        'subscription_item_id',
        '',
      ),
      premium: ValidatorUtils.containsKey<bool>(sub, 'premium', false),
      expireAt: ValidatorUtils.containsKey(sub, 'expire_at', ''),
      updatedAt: ValidatorUtils.containsKey(sub, 'updated_at', ''),
      createdAt: ValidatorUtils.containsKey(sub, 'created_at', ''),
    );
  }

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

  @override
  List<Object?> get props => [
        id,
        subscriptionItemId,
        premium,
        expireAt,
        updatedAt,
        createdAt,
      ];
}
