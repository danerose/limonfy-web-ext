import 'package:limonfy/app/domain/entities/subscription/subscription_item_prices.entity.dart';

class SubscriptionItem {
  final String id;
  final String name;
  final String productStripeId;
  final List<SubscriptionPrices> prices;
  final int amountDays;
  final String createdAt;

  SubscriptionItem({
    required this.id,
    required this.name,
    required this.productStripeId,
    required this.prices,
    required this.amountDays,
    required this.createdAt,
  });

  const SubscriptionItem.empty()
      : id = '',
        name = '',
        productStripeId = '',
        prices = const [],
        amountDays = 0,
        createdAt = '';
}
