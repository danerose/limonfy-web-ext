import 'package:flutter/material.dart';

import 'package:limonfy/core/extensions/localization.extension.dart';

class DescriptionInputMolecule extends StatelessWidget {
  const DescriptionInputMolecule({
    super.key,
    required this.onChanged,
  });

  final Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(context.l10n.description),
              const SizedBox(width: 10),
              Text('(${context.l10n.optional})')
            ],
          ),
          const SizedBox(height: 5.0),
          TextField(
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: context.l10n.typeDescription,
              helperText: '',
              prefixIcon: const Icon(Icons.text_format),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
