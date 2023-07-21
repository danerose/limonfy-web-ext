import 'package:flutter/material.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

class LoadingWithCirleBgAtom extends StatelessWidget {
  final double width;
  final double height;
  const LoadingWithCirleBgAtom({
    super.key,
    this.width = 50,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: ColorsConstants.grey.withOpacity(0.2),
      ),
      child: Center(
        child: SizedBox(
          width: width / 3,
          height: height / 3,
          child: const CircularProgressIndicator(
            strokeWidth: 1.8,
          ),
        ),
      ),
    );
  }
}
