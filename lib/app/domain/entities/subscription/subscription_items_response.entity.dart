import 'package:equatable/equatable.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';

class SubscriptionItemsResponse extends Equatable {
  final int status;
  final List<SubscriptionItem> subscriptionItems;
  final String message;

  const SubscriptionItemsResponse({
    required this.status,
    required this.subscriptionItems,
    required this.message,
  });

  const SubscriptionItemsResponse.empty()
      : status = 0,
        subscriptionItems = const [],
        message = '';

  @override
  List<Object?> get props => [
        status,
        subscriptionItems,
        message,
      ];
}
