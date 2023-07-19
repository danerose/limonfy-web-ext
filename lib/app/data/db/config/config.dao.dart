import 'dart:ui';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:limonfy/app/domain/entities/config/local_config.entity.dart';
import 'package:limonfy/core/extensions/text.extension.dart';

part 'config.dao.g.dart';

@HiveType(typeId: 0)
class ConfigDao extends HiveObject {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String mode;
  @HiveField(2)
  final String languageCode;
  @HiveField(3)
  final String countryCode;

  ConfigDao({
    required this.token,
    required this.mode,
    required this.languageCode,
    required this.countryCode,
  });

  LocalConfig toEntity() {
    return LocalConfig(
      logged: token.isNotEmpty,
      locale: Locale(languageCode, countryCode),
      mode: mode.toThemeMode(),
    );
  }
}
