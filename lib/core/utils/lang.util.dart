import 'package:flutter/foundation.dart';

class LangUtils {
  static String contryCode() {
    final c = PlatformDispatcher.instance.locale.countryCode;
    return c ?? 'MX';
  }

  static String system() {
    final l = PlatformDispatcher.instance.locale.languageCode;
    final c = PlatformDispatcher.instance.locale.countryCode;
    return '$l-$c';
  }

  static String systemLang() {
    return PlatformDispatcher.instance.locale.languageCode;
  }

  static String toLang(
    String? languageCode,
    String? countryCode,
  ) {
    final l = languageCode ?? PlatformDispatcher.instance.locale.languageCode;
    final c = countryCode ?? PlatformDispatcher.instance.locale.countryCode;
    return '$l-$c';
  }
}
