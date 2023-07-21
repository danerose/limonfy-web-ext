import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';

import 'package:limonfy/core/constants/colors.constants.dart';

class LoadingImageAtom extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  const LoadingImageAtom({
    super.key,
    this.width = 50,
    this.height = 50,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(1000),
        color: ColorsConstants.grey.withOpacity(0.2),
      ),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            strokeWidth: 1.8,
            color: injector.get<ColorsConstants>().second,
          ),
        ),
      ),
    );
  }
}
