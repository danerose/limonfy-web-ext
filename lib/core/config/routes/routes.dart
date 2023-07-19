import 'package:flutter/material.dart';

import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/routes.constants.dart';

import 'package:limonfy/app/presentation/views/auth/auth.view.dart';
import 'package:limonfy/app/presentation/views/home/home.view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.auth:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.auth),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const AuthView();
          },
        );
      case RoutesConstants.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.home),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const HomeView();
          },
        );
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (BuildContext _) {
        return const Scaffold(
          body: Center(
            child: Text('Error, Page not found'),
          ),
        );
      },
    );
  }
}
