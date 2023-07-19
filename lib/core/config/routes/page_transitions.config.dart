import 'package:flutter/material.dart';

class FadeTransitionPageRoute extends PageRouteBuilder {
  FadeTransitionPageRoute({
    required RouteSettings settings,
    required Widget Function(BuildContext, Animation<double>, Animation<double>)
        builder,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> animatioon,
            Widget child,
          ) {
            animation = CurvedAnimation(
              curve: Curves.easeOut,
              parent: animation,
            );
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: builder,
        );
}
