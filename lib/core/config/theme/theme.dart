import 'package:flutter/material.dart';
import 'package:limonfy/core/config/theme/dark.theme.dart';
import 'package:limonfy/core/config/theme/light.theme.dart';

class CustomTheme {
  static ThemeData light() {
    return limonfyLight;
  }

  static ThemeData dark() {
    return limonfyDark;
  }
}
