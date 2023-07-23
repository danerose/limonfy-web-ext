import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/app/injection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:limonfy/core/config/theme/theme.dart';
import 'package:limonfy/core/config/routes/routes.dart';
import 'package:limonfy/core/constants/routes.constants.dart';

import 'package:limonfy/app/domain/usecases/config/get_local_config.usecase.dart';

import 'package:limonfy/app/presentation/bloc/config/config.bloc.dart';
import 'package:limonfy/app/presentation/bloc/config/config.state.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfigBloc>(
      create: (_) => ConfigBloc(injector.get<GetLocalConfigUsecase>()),
      child: BlocBuilder<ConfigBloc, ConfigState>(
        buildWhen: (p, c) {
          return p.theme != c.theme || p.lang != c.lang;
        },
        builder: (BuildContext _, ConfigState state) {
          return MaterialApp(
            title: 'Limonfy',
            initialRoute: RoutesConstants.initial,
            themeMode: state.theme,
            theme: CustomTheme.light(),
            darkTheme: CustomTheme.dark(),
            locale: state.lang,
            onGenerateRoute: RouteGenerator.generateRoutes,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
