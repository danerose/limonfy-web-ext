import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.bloc.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.event.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/flat.button.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/text.button.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/error/auth_verify.error.molecule.dart';
import 'package:limonfy/core/constants/routes.constants.dart';

import 'package:limonfy/core/extensions/localization.extension.dart';

import 'package:limonfy/app/presentation/bloc/auth/verify/verify.bloc.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify.event.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify.state.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify_timer.cubit.dart';

import 'package:limonfy/app/presentation/components/molecules/inputs/otp.input.molecule.dart';

class OtpAuthFormOrganism extends StatefulWidget {
  const OtpAuthFormOrganism({super.key});

  @override
  State<OtpAuthFormOrganism> createState() => _OtpAuthFormOrganismState();
}

class _OtpAuthFormOrganismState extends State<OtpAuthFormOrganism> {
  FocusNode _focusNode = FocusNode();
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyBloc, VerifyState>(
      listener: (BuildContext context, VerifyState state) {
        if (state.status == 200) {
          context
              .read<FeaturedCollectionBloc>()
              .add(const FeatCollecInit(refresh: false));
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesConstants.home,
            (route) => false,
          );
        }
      },
      buildWhen: (p, c) => p.code != c.code || p.loading != c.loading,
      builder: (BuildContext context, VerifyState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.shrink(
              child: TextField(
                autofocus: true,
                controller: _textEditingController,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  if (value.length == 4) {
                    context.read<VerifyBloc>().add(
                          VerifyCodeChanged(code: value),
                        );
                    context.read<VerifyBloc>().add(const VerifySubmitted());
                    _focusNode.unfocus();
                  } else {
                    context.read<VerifyBloc>().add(
                          VerifyCodeChanged(
                            code: value,
                          ),
                        );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(context.l10n.enterYourCode),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(4),
                  child: OtpInputMolecule(
                    code: state.code.isEmpty || state.code.length < index + 1
                        ? '-'
                        : state.code[index],
                  ),
                  onTap: () {
                    _focusNode.unfocus();
                    _focusNode.dispose();
                    setState(() {
                      _focusNode = FocusNode();
                    });
                    _focusNode.requestFocus();
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: state.status != 0 && state.status != 200,
              child: Column(
                children: [
                  AuthVerifyErrorMolecule(
                    status: state.status,
                    message: state.message,
                    error: state.error,
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            FlatButtonMolecule(
              disable: state.loading || state.code.length < 4,
              text: context.l10n.verify,
              loading: state.loading,
              onPressed: () {
                context.read<VerifyBloc>().add(const VerifySubmitted());
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  context.l10n.didNotReceiveACode,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                BlocBuilder<VerifyTimerCubit, int>(
                  builder: (BuildContext context, int t) {
                    return Column(
                      children: [
                        TextButtonMolecule(
                          dense: true,
                          disable: state.loading || t > 0,
                          loading: state.loading,
                          underline: true,
                          text: t == 0 ? context.l10n.sendAgain : '$t \'s',
                          onPressed: () {
                            _textEditingController.clear();
                            context.read<VerifyBloc>().add(
                                  const VerifyCodeChanged(
                                    code: '',
                                  ),
                                );
                            context.read<VerifyTimerCubit>().starTimer(10);
                            context.read<VerifyBloc>().add(
                                  const VerifySendOtherSubmitted(
                                    channel: 'email',
                                  ),
                                );
                            _focusNode.requestFocus();
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
