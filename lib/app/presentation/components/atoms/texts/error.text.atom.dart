import 'package:flutter/material.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

class ErrorTextAtom extends StatelessWidget {
  const ErrorTextAtom({
    super.key,
    required this.text,
    this.maxLines,
  });

  final String text;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ColorsConstants.error,
          ),
    );
  }
}
