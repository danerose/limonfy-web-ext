import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item_prices.entity.dart';

class SubscriptionPricesModel extends Equatable {
  final String currency;
  final String priceStripeId;
  final int price;
  const SubscriptionPricesModel({
    required this.currency,
    required this.priceStripeId,
    required this.price,
  });

  factory SubscriptionPricesModel.fromJson(Map<String, dynamic>? json) {
    return SubscriptionPricesModel(
      currency: ValidatorUtils.containsKey(json, 'currency', ''),
      priceStripeId: ValidatorUtils.containsKey(json, 'price_stripe_id', ''),
      price: ValidatorUtils.containsKey<int>(json, 'price', 0),
    );
  }

  SubscriptionPrices toEntity() {
    return SubscriptionPrices(
      currency: currency,
      price: price,
      priceStripeId: priceStripeId,
    );
  }

  @override
  List<Object?> get props => [
        currency,
        price,
        priceStripeId,
      ];
}
