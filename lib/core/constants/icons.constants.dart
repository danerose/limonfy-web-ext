import 'package:limonfy/core/enum/enviroments.enum.dart';

class IconsConstants {
  final EnviromentEnum env;
  const IconsConstants({required this.env});

  String get appLogo {
    switch (env) {
      case EnviromentEnum.local:
        return 'assets/icons/img/limonfy_loc_icon.png';
      case EnviromentEnum.development:
        return 'assets/icons/img/limonfy_dev_icon.png';
      case EnviromentEnum.staging:
        return 'assets/icons/img/limonfy_stg_icon.png';
      default:
        return 'assets/icons/img/limonfy_icon.png';
    }
  }
}
