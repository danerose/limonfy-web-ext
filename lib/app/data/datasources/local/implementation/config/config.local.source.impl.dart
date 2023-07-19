import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';
import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/services/db/hive.service.dart';

import 'package:limonfy/app/data/datasources/local/interface/config/config.local.source.dart';

class ConfigLocalSourceImpl implements ConfigLocalSource {
  final HiveService hive;
  const ConfigLocalSourceImpl({required this.hive});

  @override
  Future<void> deleteLocalConfig() async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    await hive.putBox<ConfigDao>(
      BoxConstants.config,
      ConfigDao(
        token: '',
        languageCode: PlatformDispatcher.instance.locale.languageCode,
        countryCode: PlatformDispatcher.instance.locale.countryCode ?? '',
        mode: config?.mode ?? ThemeMode.system.name,
      ),
    );
  }

  @override
  Future<ConfigDao> getLocalConfig() async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    return config ??
        ConfigDao(
          token: '',
          mode: ThemeMode.system.name,
          languageCode: PlatformDispatcher.instance.locale.languageCode,
          countryCode: PlatformDispatcher.instance.locale.countryCode ?? '',
        );
  }

  @override
  Future<void> setLocalConfig(ConfigDao config) async {
    await hive.putBox<ConfigDao>(BoxConstants.config, config);
  }

  @override
  Future<void> setLangLocalConfig(Locale locale) async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    await hive.putBox<ConfigDao>(
      BoxConstants.config,
      ConfigDao(
        token: config?.token ?? '',
        mode: config?.mode ?? ThemeMode.system.name,
        languageCode: locale.languageCode,
        countryCode: locale.countryCode ?? '',
      ),
    );
  }

  @override
  Future<void> setThemeLocalConfig(ThemeMode mode) async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    await hive.putBox<ConfigDao>(
      BoxConstants.config,
      ConfigDao(
        token: config?.token ?? '',
        mode: mode.name,
        languageCode: PlatformDispatcher.instance.locale.languageCode,
        countryCode: PlatformDispatcher.instance.locale.countryCode ?? '',
      ),
    );
  }

  @override
  Future<void> setTokenLocalConfig(String token) async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    await hive.putBox<ConfigDao>(
      BoxConstants.config,
      ConfigDao(
        token: token,
        mode: config?.mode ?? ThemeMode.system.name,
        languageCode: PlatformDispatcher.instance.locale.languageCode,
        countryCode: PlatformDispatcher.instance.locale.countryCode ?? '',
      ),
    );
  }
}
