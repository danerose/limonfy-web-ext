import 'package:flutter/material.dart';
import "package:limonfy/app/injection.dart";
import "package:limonfy/core/constants/colors.constants.dart";

class DefaultLoadingAtom extends StatelessWidget {
  const DefaultLoadingAtom({super.key, this.size = 20});

  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 1.8,
          color: injector.get<ColorsConstants>().second,
        ),
      ),
    );
  }
}
