import 'dart:ui';

import 'package:limonfy/core/enum/enviroments.enum.dart';

class ColorsConstants {
  final EnviromentEnum env;
  const ColorsConstants({required this.env});

  Color get primary {
    switch (env) {
      case EnviromentEnum.local:
        return const Color.fromARGB(255, 106, 69, 122);
      case EnviromentEnum.development:
        return const Color(0xFFFFF39E);
      case EnviromentEnum.staging:
        return const Color(0xFFD0E7FF);
      default:
        return const Color(0xFFFCDDFF);
    }
  }

  Color get second {
    switch (env) {
      case EnviromentEnum.local:
        return const Color.fromARGB(255, 128, 47, 97);
      case EnviromentEnum.development:
        return const Color.fromARGB(255, 237, 145, 246);
      case EnviromentEnum.staging:
        return const Color.fromARGB(255, 138, 186, 55);
      default:
        return const Color.fromRGBO(255, 193, 7, 1);
    }
  }

  Color get input {
    switch (env) {
      case EnviromentEnum.local:
        return const Color.fromARGB(255, 93, 252, 178);
      case EnviromentEnum.development:
        return const Color.fromARGB(255, 243, 225, 92);
      case EnviromentEnum.staging:
        return const Color.fromARGB(255, 171, 211, 254);
      default:
        return const Color.fromARGB(255, 249, 189, 255);
    }
  }

  static const Color background = Color.fromARGB(255, 31, 24, 31);
  static const Color textAlt = Color.fromARGB(255, 163, 137, 163);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color disabled = Color.fromARGB(255, 212, 205, 205);
  static const Color grey = Color.fromARGB(255, 100, 100, 100);
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color success = Color.fromRGBO(102, 206, 106, 1);
  static const Color error = Color.fromRGBO(244, 62, 80, 1);
  static const Color warning = Color.fromRGBO(250, 204, 1, 1);
}
