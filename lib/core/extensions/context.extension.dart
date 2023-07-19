import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
