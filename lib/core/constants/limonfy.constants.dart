import 'package:limonfy/core/enum/enviroments.enum.dart';

class LimonfyConstants {
  final EnviromentEnum env;
  const LimonfyConstants({required this.env});

  String get version {
    switch (env) {
      case EnviromentEnum.local:
        return '1.0.0-3';
      case EnviromentEnum.development:
        return '1.0.0-3';
      case EnviromentEnum.staging:
        return '1.0.0-2';
      default:
        return '1.0.0-1';
    }
  }

  static const limonfy = 'Limonfy';
  static const limonfyWeb = 'https://limonfy.app';
  static const limonfyWebPrivacy = 'https://limonfy.app/privacy';
  static const limonfyWebTermsLimonfy = 'https://limonfy.app/terms';

  static const successAppPaymentUrl =
      'https://www.limonfy.app/payment/app/success';

  static const cancelAppPaymentUrl =
      'https://www.limonfy.app/payment/app/cancel';

  static const urlIcon =
      'https://res.cloudinary.com/dev-limonfy/image/upload/v1687819513/Assets/limonfy_icon_me6sl9.png';

  static const urlBanner =
      'https://res.cloudinary.com/dev-limonfy/image/upload/v1687819511/Assets/limonfy_banner_xampia.png';
}
