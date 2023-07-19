import 'package:limonfy/core/constants/limonfy.constants.dart';

extension AllowAccessExt on String {
  bool get isLimonfy {
    return this == '' || this == LimonfyConstants.limonfy;
  }
}
