import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _media = const MediaQueryData();
  double sizeH = 0;
  double sizeV = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  double safeHorizontal = 0;
  double safeVertical = 0;

  void init(BuildContext context) {
    _media = MediaQuery.of(context);
    sizeH = _media.size.width / 100;
    sizeV = _media.size.height / 100;
    _safeAreaHorizontal = _media.padding.left + _media.padding.right;
    _safeAreaVertical = _media.padding.top + _media.padding.bottom;
    safeHorizontal = (_media.size.width - _safeAreaHorizontal) / 100;
    safeVertical = (_media.size.height - _safeAreaVertical) / 100;
  }
}
