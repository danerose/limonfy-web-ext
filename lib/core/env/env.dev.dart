import 'package:limonfy/core/env/env.dart';
import 'package:limonfy/core/enum/enviroments.enum.dart';

class DevEnv implements Env {
  @override
  String get apiURL => 'https://dev.api.limonfy.app/v1';

  @override
  String get encryptKeyHive => 'limonfydev2023limofyApp';

  @override
  EnviromentEnum get env => EnviromentEnum.development;
}
