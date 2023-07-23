import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/usecases/auth/login.usecase.dart';
import 'package:limonfy/app/domain/usecases/auth/verify.usecase.dart';

import 'package:limonfy/app/injection.dart';
import 'package:limonfy/app/presentation/bloc/auth/login/login.bloc.dart';
import 'package:limonfy/app/presentation/bloc/auth/login/login.state.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify.bloc.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify.event.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify_timer.cubit.dart';
import 'package:limonfy/app/presentation/components/organisms/forms/login.form.organism.dart';
import 'package:limonfy/app/presentation/components/organisms/forms/otp_auth.form.organism.dart';
import 'package:limonfy/core/constants/colors.constants.dart';
import 'package:limonfy/core/constants/icons.constants.dart';

import 'package:limonfy/app/presentation/components/atoms/images/image.atom.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

class LoginAuthView extends StatelessWidget {
  const LoginAuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(injector.get<LocalLogInUsecase>()),
        ),
        BlocProvider<VerifyBloc>(
          create: (_) => VerifyBloc(
            injector.get<VerifyOtpAuthUsecase>(),
            injector.get<VerifySendOtherAuthUsecase>(),
          ),
        ),
        BlocProvider(create: (_) => VerifyTimerCubit())
      ],
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state.status == 200) {
            context.read<VerifyBloc>().add(VerifyInit(
                token: state.token,
                reason: state.reason,
                sendCodeMethods: state.sendCodeMethods));
          }
        },
        builder: (BuildContext context, LoginState state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: state.status != 200,
                              replacement: Text(
                                context.l10n.verificationCode,
                                style: const TextStyle(fontSize: 20),
                              ),
                              child: Text(
                                context.l10n.logIn,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Visibility(
                              visible: state.status != 200,
                              replacement: Text(
                                context.l10n.verificationCodeEmailDescription,
                                style: const TextStyle(
                                  color: ColorsConstants.disabled,
                                ),
                              ),
                              child: Text(
                                context.l10n.happyToSeeYouAgain,
                                style: const TextStyle(
                                  color: ColorsConstants.disabled,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ImageAtom(
                        height: 40,
                        width: 40,
                        borderRadius: BorderRadius.circular(100),
                        asset: injector.get<IconsConstants>().appLogo,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Visibility(
                    visible: state.status != 200,
                    replacement: const OtpAuthFormOrganism(),
                    child: const LoginFormOrganism(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
