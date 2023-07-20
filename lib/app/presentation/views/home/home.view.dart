import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/app/presentation/components/atoms/images/image.atom.dart';
import 'package:limonfy/core/constants/icons.constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ImageAtom(asset: injector.get<IconsConstants>().appLogo)
            ],
          )
        ],
      ),
    );
  }
}
