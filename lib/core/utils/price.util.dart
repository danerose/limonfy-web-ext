import 'package:intl/intl.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription_item_prices.entity.dart';

class PriceUtils {
  static int amount(
    String country,
    List<SubscriptionPrices> prices,
  ) {
    final currency = country.toLowerCase() == 'mx' ? 'mxn' : 'usd';
    final i = prices.indexWhere((e) => e.currency.toLowerCase() == currency);
    return prices[i].price * 100;
  }

  static int price(
    String country,
    List<SubscriptionPrices> prices,
  ) {
    final currency = country.toLowerCase() == 'mx' ? 'mxn' : 'usd';
    final i = prices.indexWhere((e) => e.currency.toLowerCase() == currency);
    return prices[i].price;
  }

  static String currency(
    String country,
  ) {
    return country.toLowerCase() == 'mx' ? 'mxn' : 'usd';
  }

  static SubscriptionPrices priceId(
    String country,
    List<SubscriptionPrices> prices,
  ) {
    final currency = country.toLowerCase() == 'mx' ? 'mxn' : 'usd';
    final i = prices.indexWhere((e) => e.currency.toLowerCase() == currency);
    return prices[i];
  }

  static String priceFormat(
    String country,
    List<SubscriptionPrices> prices,
  ) {
    final formatCurrency = NumberFormat.simpleCurrency();
    final currency = country.toLowerCase() == 'mx' ? 'mxn' : 'usd';
    final i = prices.indexWhere((e) => e.currency.toLowerCase() == currency);
    return formatCurrency.format(prices[i].price);
  }
}
