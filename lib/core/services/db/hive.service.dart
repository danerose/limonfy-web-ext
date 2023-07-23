import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:limonfy/core/constants/box.constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';
import 'package:limonfy/app/data/db/user/user_account.dao.dart';
import 'package:limonfy/app/data/db/user/user_profile.dao.dart';
import 'package:limonfy/app/data/db/subcription/subscription.dao.dart';
import 'package:limonfy/app/data/db/collection/link.collection.dao.dart';

class HiveService {
  late String encryptKey = '';
  final secureStorage = const FlutterSecureStorage();

  HiveService({required String key}) {
    encryptKey = key;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }

  Future<void> _registerAdapters() async {
    Hive.registerAdapter(UserAccountDaoAdapter());
    Hive.registerAdapter(UserProfileDaoAdapter());
    Hive.registerAdapter(LinkCollectionDaoAdapter());
    Hive.registerAdapter(ConfigDaoAdapter());
    Hive.registerAdapter(SubscriptionDaoAdapter());
  }

  Future<void> _initBoxes() async {
    try {
      if (!await secureStorage.containsKey(key: encryptKey)) {
        await secureStorage.write(
          key: encryptKey,
          value: base64UrlEncode(Hive.generateSecureKey()),
        );
      }
      final k = await secureStorage.read(key: encryptKey);
      final key = base64Url.decode(k ?? '');
      await Hive.openBox<UserAccountDao>(
        BoxConstants.account,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<UserProfileDao>(
        BoxConstants.profile,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<List<LinkCollectionDao>>(
        BoxConstants.featuredLinksCollect,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<ConfigDao>(
        BoxConstants.config,
        encryptionCipher: HiveAesCipher(key),
      );
      await Hive.openBox<SubscriptionDao>(
        BoxConstants.subscription,
        encryptionCipher: HiveAesCipher(key),
      );
    } catch (e) {
      await secureStorage.deleteAll();
      await _initBoxes();
    }
  }

  Future<void> addBox<T>(String name, T value) async {
    final box = Hive.box<T>(name);
    await box.add(value);
  }

  Future<T?> getBox<T>(String name) async {
    final box = Hive.box<T>(name);
    return box.get(name);
  }

  Future<void> putBox<T>(String name, T value) async {
    final box = Hive.box<T>(name);
    await box.put(name, value);
  }
}
