import 'package:flutter/material.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/presentation/components/molecules/avatars/collection.avatart.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/avatars/loading_collection.avatar.molecule.dart';
import 'package:limonfy/core/constants/colors.constants.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

class CollectionsAvatarListOrganism extends StatelessWidget {
  const CollectionsAvatarListOrganism({
    super.key,
    required this.selected,
    required this.loading,
    required this.collections,
    required this.status,
    required this.onCollectionPressed,
    required this.onErrorPressed,
  });

  final int status;
  final bool loading;
  final bool Function(LinkCollection collection) selected;
  final List<LinkCollection> collections;
  final Function(LinkCollection collection) onCollectionPressed;
  final Function() onErrorPressed;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const LoadingCollectionAvatarMolecule();
    } else {
      if (status == 200) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(collections.length, (int i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CollectionAvatarMolecule(
                  selected: selected(collections[i]),
                  collection: collections[i],
                  onCollectionPressed: onCollectionPressed,
                ),
              );
            }),
          ),
        );
      } else {
        return Column(
          children: [
            const SizedBox(height: 50),
            InkWell(
              borderRadius: BorderRadius.circular(1000),
              onTap: onErrorPressed,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: ColorsConstants.grey.withOpacity(0.1),
                  ),
                  child: const Center(child: Icon(Icons.replay_outlined)),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              child: Center(child: Text(context.l10n.somethingWentWrong)),
            ),
            const SizedBox(height: 20),
          ],
        );
      }
    }
  }
}
