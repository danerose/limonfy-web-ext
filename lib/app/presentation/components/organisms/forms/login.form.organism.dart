import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/core/enum/validations.enum.dart';

import 'package:limonfy/core/extensions/localization.extension.dart';

import 'package:limonfy/app/presentation/bloc/auth/login/login.bloc.dart';
import 'package:limonfy/app/presentation/bloc/auth/login/login.event.dart';
import 'package:limonfy/app/presentation/bloc/auth/login/login.state.dart';

import 'package:limonfy/app/presentation/components/molecules/error/auth.error.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/inputs/email.input.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/flat.button.molecule.dart';

class LoginFormOrganism extends StatelessWidget {
  const LoginFormOrganism({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => p.email != c.email || p.loading != c.loading,
      builder: (BuildContext context, LoginState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailInputMolecule(
              emailValidation: state.valid,
              onSubmitted: (value) {
                if (!state.loading) {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                }
              },
              onChanged: (value) {
                context.read<LoginBloc>().add(
                      LoginEmailChanged(
                        email: value,
                      ),
                    );
              },
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: state.status != 0 && state.status != 200,
              replacement: const SizedBox.shrink(),
              child: Column(
                children: [
                  AuthErrorMolecule(
                    status: state.status,
                    message: state.message,
                    error: state.error,
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            FlatButtonMolecule(
              disable: !(state.valid == EmailValidationEnum.valid),
              loading: state.loading,
              text: context.l10n.logIn,
              onPressed: () {
                context.read<LoginBloc>().add(const LoginSubmitted());
              },
            ),
          ],
        );
      },
    );
  }
}
