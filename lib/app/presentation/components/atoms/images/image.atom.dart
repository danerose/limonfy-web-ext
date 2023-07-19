import 'package:flutter/material.dart';

class ImageAtom extends StatelessWidget {
  const ImageAtom({
    super.key,
    required this.asset,
    this.width = 50,
    this.height = 50,
    this.boxFit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  final String asset;
  final double width;
  final double height;
  final BoxFit boxFit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(fit: boxFit, image: AssetImage(asset)),
      ),
    );
  }
}
