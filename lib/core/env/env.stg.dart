import 'package:limonfy/core/env/env.dart';
import 'package:limonfy/core/enum/enviroments.enum.dart';

class StgEnv implements Env {
  @override
  String get apiURL => 'https://stg.api.limonfy.app/v1';

  @override
  String get encryptKeyHive => 'limonfystg2023limofyApp';

  @override
  EnviromentEnum get env => EnviromentEnum.staging;
}
