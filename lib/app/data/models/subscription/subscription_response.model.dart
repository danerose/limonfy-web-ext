import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';

import 'package:limonfy/app/data/models/subscription/subscription.model.dart';
import 'package:limonfy/app/data/models/subscription/subscription_item.model.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

class SubscriptionResponseModel extends Equatable {
  final int status;
  final SubscriptionModel subscription;
  final SubscriptionItemModel subscriptionItem;
  final String message;

  const SubscriptionResponseModel({
    required this.status,
    required this.subscription,
    required this.subscriptionItem,
    required this.message,
  });

  factory SubscriptionResponseModel.fromJson(Map<String, dynamic>? json) {
    return SubscriptionResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      subscription: SubscriptionModel.fromJson(
        ValidatorUtils.containsKey(json, 'subscription', null),
      ),
      subscriptionItem: SubscriptionItemModel.fromJson(
        ValidatorUtils.containsKey(json, 'subscription_item', null),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  SubscriptionResponse toEntity() {
    return SubscriptionResponse(
      status: status,
      subscription: subscription.toEntity(),
      subscriptionItem: subscriptionItem.toEntity(),
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        subscription,
        subscriptionItem,
        message,
      ];
}
