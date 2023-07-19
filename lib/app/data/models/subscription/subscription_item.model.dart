import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';

import 'package:limonfy/app/data/models/subscription/subscription_item_prices.model.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item_prices.entity.dart';

class SubscriptionItemModel extends Equatable {
  final String id;
  final String name;
  final String productStripeId;
  final List<SubscriptionPricesModel> prices;
  final int amountDays;
  final String createdAt;

  const SubscriptionItemModel({
    required this.id,
    required this.name,
    required this.productStripeId,
    required this.prices,
    required this.amountDays,
    required this.createdAt,
  });

  factory SubscriptionItemModel.fromJson(Map<String, dynamic>? json) {
    return SubscriptionItemModel(
      id: ValidatorUtils.containsKey(json, '_id', ''),
      name: ValidatorUtils.containsKey(json, 'name', ''),
      productStripeId: ValidatorUtils.containsKey(
        json,
        'product_stripe_id',
        '',
      ),
      prices: List<SubscriptionPricesModel>.from(
        ValidatorUtils.containsKey(
          json,
          'prices',
          [],
        ).map((e) => SubscriptionPricesModel.fromJson(e)),
      ),
      amountDays: ValidatorUtils.containsKey<int>(json, 'amount_days', 0),
      createdAt: ValidatorUtils.containsKey(json, 'created_at', ''),
    );
  }

  SubscriptionItem toEntity() {
    return SubscriptionItem(
      id: id,
      name: name,
      productStripeId: productStripeId,
      prices: List<SubscriptionPrices>.from(prices.map((e) => e.toEntity())),
      amountDays: amountDays,
      createdAt: createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        productStripeId,
        amountDays,
        prices,
        createdAt,
      ];
}
