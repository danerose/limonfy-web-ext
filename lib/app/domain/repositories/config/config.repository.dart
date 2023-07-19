import 'package:flutter/material.dart';
import 'package:limonfy/app/domain/entities/config/local_config.entity.dart';

abstract class ConfigReponsitory {
  Future<void> deleteLocalConfig();
  Future<void> setThemeLocalConfig(ThemeMode mode);
  Future<void> setTokenLocalConfig(String token);
  Future<void> setLangLocalConfig(Locale locale);
  Future<void> setLocalConfig(LocalConfig config);
  Future<LocalConfig> getLocalConfig();
}
