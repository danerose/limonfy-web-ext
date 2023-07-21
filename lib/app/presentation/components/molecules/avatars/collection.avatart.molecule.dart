import 'package:flutter/material.dart';
import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/constants/colors.constants.dart';

import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/presentation/components/molecules/image/image.molecule.dart';

class CollectionAvatarMolecule extends StatelessWidget {
  const CollectionAvatarMolecule({
    super.key,
    required this.selected,
    required this.collection,
    required this.onCollectionPressed,
  });

  final bool selected;
  final LinkCollection collection;
  final Function(LinkCollection collection) onCollectionPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(1000),
          onTap: () => onCollectionPressed(collection),
          child: Padding(
            padding: EdgeInsets.all(selected ? 2.0 : 4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  border: selected
                      ? Border.all(
                          color: injector.get<ColorsConstants>().second,
                          width: 3,
                        )
                      : null),
              child: ImageMolecule(
                url: collection.imageUrl,
                width: 40,
                height: 40,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 50,
          child: Center(
            child: Text(
              collection.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: selected ? injector.get<ColorsConstants>().second : null,
              ),
            ),
          ),
        )
      ],
    );
  }
}
