import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';

import 'package:limonfy/core/constants/colors.constants.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

import 'package:limonfy/app/presentation/components/molecules/image/image.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/text.button.molecule.dart';

import 'package:limonfy/app/presentation/components/atoms/images/loading.image.atom.dart';
import 'package:skeletons/skeletons.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({
    super.key,
    required this.loading,
    required this.profile,
    required this.refresh,
  });

  final bool loading;
  final UserProfile profile;
  final Function() refresh;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const LoadingImageAtom(width: 30, height: 30),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 15,
                      width: injector.get<SizeConfig>().sizeH * 40,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    context.l10n.saveYourLinks,
                    style: const TextStyle(
                      color: ColorsConstants.disabled,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          TextButtonMolecule(
            dense: true,
            loading: true,
            text: context.l10n.refresh,
            onPressed: () {},
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageMolecule(
                url: profile.profileImage,
                width: 30,
                height: 30,
                borderRadius: BorderRadius.circular(100),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.displayName,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    context.l10n.saveYourLinks,
                    style: const TextStyle(
                      color: ColorsConstants.disabled,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          TextButtonMolecule(
            dense: true,
            text: context.l10n.refresh,
            onPressed: refresh,
          )
        ],
      );
    }
  }
}
