import 'package:flutter/material.dart';
import 'package:limonfy/app/presentation/components/atoms/loading/loading_with_circle_bg.atom.dart';

class LoadingCollectionAvatarMolecule extends StatelessWidget {
  const LoadingCollectionAvatarMolecule({
    super.key,
    this.items = 10,
  });

  final int items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items,
          (int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  LoadingWithCirleBgAtom(),
                  Text('...'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
