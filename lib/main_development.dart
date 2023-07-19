import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:limonfy/app/app.dart';
import 'package:limonfy/app/injection.dart';

import 'package:limonfy/core/env/env.dev.dart';
import 'package:limonfy/core/services/db/hive.service.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await init(DevEnv());
    await injector.get<HiveService>().init();

    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      log(
        errorDetails.library ?? '',
        name: 'RunZonedGuardedFlutterError',
        error: errorDetails.exception,
        stackTrace: errorDetails.stack,
      );
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      log(
        error.toString(),
        name: 'RunZonedGuardedPlatform',
        error: error,
        stackTrace: stack,
      );
      return true;
    };

    runApp(const App());
  }, (Object error, StackTrace stack) async {
    log(
      error.toString(),
      name: 'RunZonedGuarded',
      error: error,
      stackTrace: stack,
    );
  });
}
