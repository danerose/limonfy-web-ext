import 'package:limonfy/core/env/env.dart';
import 'package:limonfy/core/enum/enviroments.enum.dart';

class ProEnv implements Env {
  @override
  String get apiURL => 'https://api.limonfy.app/v1';

  @override
  String get encryptKeyHive => 'limonfypro2023limofyApp';

  @override
  EnviromentEnum get env => EnviromentEnum.production;
}
