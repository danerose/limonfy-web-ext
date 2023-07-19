import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';

import 'package:limonfy/app/data/models/subscription/subscription_item.model.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_items_response.entity.dart';

class SubscriptionItemsResponseModel extends Equatable {
  final int status;
  final List<SubscriptionItemModel> subscriptionItems;
  final String message;

  const SubscriptionItemsResponseModel({
    required this.status,
    required this.subscriptionItems,
    required this.message,
  });

  factory SubscriptionItemsResponseModel.fromJson(Map<String, dynamic>? json) {
    return SubscriptionItemsResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      subscriptionItems: List<SubscriptionItemModel>.from(
        ValidatorUtils.containsKey(json, 'subcription_items', []).map(
          (e) => SubscriptionItemModel.fromJson(e),
        ),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  SubscriptionItemsResponse toEntity() {
    return SubscriptionItemsResponse(
      status: status,
      subscriptionItems: List<SubscriptionItem>.from(
        subscriptionItems.map((e) => e.toEntity()),
      ),
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        subscriptionItems,
        message,
      ];
}
