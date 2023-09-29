import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LanguagesCheckboxList extends StatelessWidget {
  const LanguagesCheckboxList({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: languages
          .map(
            (language) => CheckboxListTile(
              dense: true,
              title: Text(
                language,
              ),
              value: value,
              onChanged: onChanged,
            ),
          )
          .toList(),
    );
  }
}
