import 'package:equatable/equatable.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';

class SubscriptionResponse extends Equatable {
  final int status;
  final Subscription subscription;
  final SubscriptionItem subscriptionItem;
  final String message;

  const SubscriptionResponse({
    required this.status,
    required this.subscription,
    required this.subscriptionItem,
    required this.message,
  });

  const SubscriptionResponse.empty()
      : status = 0,
        subscription = const Subscription.empty(),
        subscriptionItem = const SubscriptionItem.empty(),
        message = '';

  @override
  List<Object?> get props => [
        status,
        subscription,
        subscriptionItem,
        message,
      ];
}
