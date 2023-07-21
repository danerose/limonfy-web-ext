import 'package:flutter/material.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/flat.button.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/card/link.card.molecule.dart';
import 'package:limonfy/app/presentation/components/molecules/card/link_loading.card.molecule.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

class CreateLinkFormOrganism extends StatelessWidget {
  const CreateLinkFormOrganism({
    super.key,
    required this.loading,
    required this.creating,
    required this.private,
    required this.link,
    required this.onPrivate,
    required this.onSaved,
  });

  final bool loading;
  final bool creating;
  final bool private;
  final Link link;
  final Function(bool v) onPrivate;
  final Function() onSaved;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Column(
        children: [
          const LinkLoadingCardMolecule(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FlatButtonMolecule(
              text: context.l10n.loading,
              onPressed: null,
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          LinkCardMolecule(link: link),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.makeThisLinkPrivate),
                Checkbox(
                  value: private,
                  onChanged: (bool? v) => onPrivate(v ?? false),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: FlatButtonMolecule(
                loading: creating,
                text: context.l10n.save,
                onPressed: onSaved,
              ),
            ),
          )
        ],
      );
    }
  }
}
