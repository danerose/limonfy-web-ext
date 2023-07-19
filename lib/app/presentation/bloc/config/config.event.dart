import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class ConfigInit extends ConfigEvent {
  const ConfigInit();
}

class ConfigThemeChange extends ConfigEvent {
  const ConfigThemeChange({required this.mode});
  final ThemeMode mode;
}

class ConfigShowLinksChange extends ConfigEvent {
  const ConfigShowLinksChange({required this.show});
  final bool show;
}

class ConfigLocaleChange extends ConfigEvent {
  const ConfigLocaleChange({required this.locale});
  final Locale locale;
}

class ConfigOnClear extends ConfigEvent {
  const ConfigOnClear();
}

class ConfigLogout extends ConfigEvent {
  const ConfigLogout({required this.logout});
  final bool logout;
}
