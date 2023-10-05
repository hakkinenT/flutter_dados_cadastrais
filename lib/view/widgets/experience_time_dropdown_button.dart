import 'package:flutter/material.dart';

import '../../utils/spaces.dart';

class ExperienceTimeDropdownButton extends StatelessWidget {
  const ExperienceTimeDropdownButton({
    super.key,
    required this.value,
    this.onChanged,
  });

  final int value;
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value == 0 ? null : value,
      isExpanded: true,
      hint: const Text(
        '2 anos',
        style: TextStyle(color: Colors.black38),
      ),
      items: List<DropdownMenuItem<int>>.generate(
        50,
        (index) => DropdownMenuItem<int>(
          value: index,
          child: Text(
            '${index.toString()} anos',
          ),
        ),
      ),
      decoration: decoration,
      onChanged: onChanged,
    );
  }

  final decoration = const InputDecoration(
      contentPadding: EdgeInsets.all(10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ));
}
