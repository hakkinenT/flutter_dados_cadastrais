import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LevelRadioList extends StatelessWidget {
  const LevelRadioList(
      {super.key,
      required this.selected,
      required this.groupValue,
      this.onChanged});

  final bool selected;
  final String groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: levels
          .map((level) => RadioListTile(
                dense: true,
                title: Text(
                  level.toString(),
                ),
                contentPadding: const EdgeInsets.only(left: 0),
                value: level.toString(),
                groupValue: groupValue,
                selected: selected,
                onChanged: onChanged,
              ))
          .toList(),
    );
  }
}
