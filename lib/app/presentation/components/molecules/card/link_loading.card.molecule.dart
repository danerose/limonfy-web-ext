import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:skeletons/skeletons.dart';
import 'package:limonfy/core/config/size/size.config.dart';

class LinkLoadingCardMolecule extends StatelessWidget {
  const LinkLoadingCardMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: injector.get<SizeConfig>().sizeH * 20,
                height: injector.get<SizeConfig>().sizeH * 20,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    width: injector.get<SizeConfig>().sizeH * 40,
                  ),
                ),
                const SizedBox(height: 5),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: injector.get<SizeConfig>().sizeH * 50,
                  ),
                ),
                const SizedBox(height: 2),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: injector.get<SizeConfig>().sizeH * 50,
                  ),
                ),
                const SizedBox(height: 2),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: injector.get<SizeConfig>().sizeH * 50,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
