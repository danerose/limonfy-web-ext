import 'package:limonfy/core/enum/enviroments.enum.dart';

abstract class Env {
  String get apiURL => '';
  String get encryptKeyHive => '';
  EnviromentEnum get env => EnviromentEnum.none;
}
