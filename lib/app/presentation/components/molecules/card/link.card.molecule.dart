import 'package:flutter/material.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/app/presentation/components/molecules/image/image.molecule.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

class LinkCardMolecule extends StatelessWidget {
  const LinkCardMolecule({super.key, required this.link});

  final Link link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImageMolecule(
              url: link.imageUrl,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(4),
              width: injector.get<SizeConfig>().sizeH * 20,
              height: injector.get<SizeConfig>().sizeH * 20,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  link.title,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  link.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorsConstants.disabled,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
