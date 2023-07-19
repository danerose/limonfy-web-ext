import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class LocalConfig extends Equatable {
  final bool logged;
  final Locale locale;
  final ThemeMode mode;

  const LocalConfig({
    required this.logged,
    required this.locale,
    required this.mode,
  });

  LocalConfig.empty()
      : logged = false,
        mode = ThemeMode.system,
        locale = PlatformDispatcher.instance.locale;

  @override
  List<Object?> get props => [logged, locale, mode];
}
