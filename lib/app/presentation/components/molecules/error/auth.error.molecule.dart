import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';

import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/colors.constants.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

import 'package:limonfy/app/presentation/components/atoms/texts/error.text.atom.dart';

class AuthErrorMolecule extends StatelessWidget {
  const AuthErrorMolecule({
    super.key,
    required this.status,
    required this.message,
    required this.error,
  });

  final int status;
  final String message;
  final ExceptionEnum error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: injector.get<SizeConfig>().sizeH * 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsConstants.error.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            if (error == ExceptionEnum.request) {
              switch (status) {
                case 404:
                  return ErrorTextAtom(
                    text: context.l10n.emailWrongOrNotFound,
                  );
                case 409:
                  return ErrorTextAtom(
                    text: context.l10n.emailAlreadyExist,
                  );
                default:
                  return ErrorTextAtom(
                    text: context.l10n.unknownError,
                  );
              }
            } else {
              switch (error) {
                case ExceptionEnum.socket:
                  return ErrorTextAtom(
                    text: context.l10n.noInternetConnection,
                  );
                default:
                  return ErrorTextAtom(
                    text: context.l10n.unknownError,
                  );
              }
            }
          },
        ),
      ),
    );
  }
}
