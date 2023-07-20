import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

class OtpInputMolecule extends StatelessWidget {
  const OtpInputMolecule({super.key, required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: injector.get<SizeConfig>().sizeH * 20,
      height: injector.get<SizeConfig>().sizeH * 20,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstants.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            code,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
