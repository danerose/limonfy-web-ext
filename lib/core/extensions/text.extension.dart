import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalize() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
