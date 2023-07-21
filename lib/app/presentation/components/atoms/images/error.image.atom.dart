import 'package:flutter/material.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

class ErrorImageAtom extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  const ErrorImageAtom({
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
      child: const Center(
        child: Icon(
          Icons.format_overline,
          color: ColorsConstants.grey,
        ),
      ),
    );
  }
}
