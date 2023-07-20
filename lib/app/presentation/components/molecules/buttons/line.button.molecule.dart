import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';

class LineButtonMolecule extends StatelessWidget {
  const LineButtonMolecule({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.dense = false,
    this.underline = false,
    this.loading = false,
    this.disable = false,
    required this.onPressed,
  });

  final String text;
  final double fontSize;
  final bool loading;
  final bool dense;
  final bool underline;
  final bool disable;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SizedBox(
        width: dense ? null : injector.get<SizeConfig>().sizeV * 100,
        child: const OutlinedButton(
          onPressed: null,
          child: Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: dense ? null : injector.get<SizeConfig>().sizeV * 100,
        child: OutlinedButton(
          onPressed: disable ? null : onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      );
    }
  }
}
