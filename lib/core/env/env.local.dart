import 'package:limonfy/core/env/env.dart';
import 'package:limonfy/core/enum/enviroments.enum.dart';

class LocalEnv implements Env {
  @override
  String get apiURL => 'http://192.168.1.66:3001/v1';

  @override
  String get encryptKeyHive => 'limonfydev2023limofyApp';

  @override
  EnviromentEnum get env => EnviromentEnum.local;
}
