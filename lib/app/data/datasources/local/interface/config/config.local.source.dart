import 'package:flutter/material.dart';
import 'package:limonfy/app/data/db/config/config.dao.dart';

abstract class ConfigLocalSource {
  Future<void> deleteLocalConfig();
  Future<void> setThemeLocalConfig(ThemeMode mode);
  Future<void> setTokenLocalConfig(String token);
  Future<void> setLangLocalConfig(Locale locale);
  Future<void> setLocalConfig(ConfigDao config);
  Future<ConfigDao> getLocalConfig();
  // Future<>
}
