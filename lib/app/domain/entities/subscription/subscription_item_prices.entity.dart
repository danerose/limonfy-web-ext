import 'package:equatable/equatable.dart';

class SubscriptionPrices extends Equatable {
  final String currency;
  final String priceStripeId;
  final int price;

  const SubscriptionPrices({
    required this.currency,
    required this.priceStripeId,
    required this.price,
  });
  const SubscriptionPrices.empty()
      : currency = '',
        priceStripeId = '',
        price = 0;

  @override
  List<Object?> get props => [
        currency,
        price,
        priceStripeId,
      ];
}
