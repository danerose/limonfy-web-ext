import 'package:flutter/material.dart';

import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

import 'package:limonfy/core/extensions/localization.extension.dart';

class EmailInputMolecule extends StatelessWidget {
  const EmailInputMolecule({
    super.key,
    required this.emailValidation,
    required this.onChanged,
  });

  final EmailValidationEnum emailValidation;
  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.email),
          const SizedBox(height: 5.0),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              hintText: context.l10n.typeYourEmail,
              errorText: emailValidation == EmailValidationEnum.empty
                  ? context.l10n.emailCannotBeEmpty
                  : emailValidation == EmailValidationEnum.invalid
                      ? context.l10n.pleaseEnterAValidEmail
                      : null,
              helperText: emailValidation == EmailValidationEnum.valid
                  ? context.l10n.emailEverythingIsFine
                  : null,
              helperStyle: const TextStyle(color: ColorsConstants.success),
              prefixIcon: const Icon(Icons.mail_outline_rounded),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
