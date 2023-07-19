import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/theme/theme.dart';
import 'package:limonfy/core/config/routes/routes.dart';
import 'package:limonfy/core/constants/routes.constants.dart';

import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';
import 'package:limonfy/app/domain/usecases/config/get_local_config.usecase.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';

import 'package:limonfy/app/presentation/bloc/config/config.bloc.dart';
import 'package:limonfy/app/presentation/bloc/config/config.state.dart';

import 'package:limonfy/app/presentation/bloc/collections/featured/featured.bloc.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigBloc>(
          create: (_) => ConfigBloc(
            injector.get<GetUserAccountUsecase>(),
            injector.get<GetUserProfileUsecase>(),
            injector.get<GetLocalConfigUsecase>(),
          ),
        ),
        BlocProvider<FeaturedCollectionBloc>(
          create: (_) => FeaturedCollectionBloc(
            injector.get<GetFeaturedCollectionUsecase>(),
          ),
        ),
      ],
      child: BlocBuilder<ConfigBloc, ConfigState>(
        buildWhen: (p, c) {
          return p.theme != c.theme || p.lang != c.lang;
        },
        builder: (BuildContext context, ConfigState configState) {
          return MaterialApp(
            title: 'Limonfy',
            initialRoute: RoutesConstants.initial,
            themeMode: configState.theme,
            theme: CustomTheme.light(),
            darkTheme: CustomTheme.dark(),
            locale: configState.lang,
            onGenerateRoute: RouteGenerator.generateRoutes,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
