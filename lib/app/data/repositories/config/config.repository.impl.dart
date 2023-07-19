import 'package:flutter/material.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';

import 'package:limonfy/app/domain/entities/config/local_config.entity.dart';

import 'package:limonfy/app/domain/repositories/config/config.repository.dart';

import 'package:limonfy/app/data/datasources/local/interface/config/config.local.source.dart';

class ConfigReponsitotyImpl implements ConfigReponsitory {
  final ConfigLocalSource configLocalSource;
  const ConfigReponsitotyImpl({required this.configLocalSource});

  @override
  Future<void> deleteLocalConfig() async {
    await configLocalSource.deleteLocalConfig();
  }

  @override
  Future<LocalConfig> getLocalConfig() async {
    final dao = await configLocalSource.getLocalConfig();
    return dao.toEntity();
  }

  @override
  Future<void> setLangLocalConfig(Locale locale) async {
    await configLocalSource.setLangLocalConfig(locale);
  }

  @override
  Future<void> setLocalConfig(LocalConfig config) async {
    final dao = await configLocalSource.getLocalConfig();
    await configLocalSource.setLocalConfig(
      ConfigDao(
        token: dao.token,
        mode: config.mode.toString(),
        languageCode: config.locale.languageCode,
        countryCode: config.locale.countryCode ?? '',
      ),
    );
  }

  @override
  Future<void> setThemeLocalConfig(ThemeMode mode) async {
    await configLocalSource.setThemeLocalConfig(mode);
  }

  @override
  Future<void> setTokenLocalConfig(String token) async {
    await configLocalSource.setTokenLocalConfig(token);
  }
}
