import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/icons.constants.dart';

import 'package:limonfy/core/constants/colors.constants.dart';

import 'package:limonfy/app/presentation/bloc/config/config.bloc.dart';
import 'package:limonfy/app/presentation/bloc/config/config.state.dart';
import 'package:limonfy/app/presentation/bloc/config/config.event.dart';

import 'package:limonfy/app/presentation/components/atoms/images/image.atom.dart';
import 'package:limonfy/app/presentation/components/atoms/loading/default.loading.atom.dart';
import 'package:limonfy/core/constants/routes.constants.dart';
import 'package:limonfy/core/enum/logged.enum.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ConfigBloc>()..add(const ConfigInit()),
      child: Scaffold(
        backgroundColor: injector.get<ColorsConstants>().primary,
        body: BlocListener<ConfigBloc, ConfigState>(
          listener: (BuildContext _, ConfigState state) {
            if (state.logged == LoggedEnum.logged) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesConstants.home,
                (route) => false,
              );
            } else {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesConstants.authLogin,
                (route) => false,
              );
            }
          },
          child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: ImageAtom(
                    width: injector.get<SizeConfig>().sizeH * 25,
                    height: injector.get<SizeConfig>().sizeH * 25,
                    asset: injector.get<IconsConstants>().appLogo,
                  ),
                ),
                Positioned.fill(
                  top: injector.get<SizeConfig>().sizeV * 40,
                  child: const DefaultLoadingAtom(size: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
