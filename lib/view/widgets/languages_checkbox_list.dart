import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LanguagesCheckboxList extends StatefulWidget {
  const LanguagesCheckboxList({super.key, required this.languagesSelected});

  final List<String> languagesSelected;

  @override
  State<LanguagesCheckboxList> createState() => _LanguagesCheckboxListState();
}

class _LanguagesCheckboxListState extends State<LanguagesCheckboxList> {
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
              value: widget.languagesSelected.contains(language),
              onChanged: (value) => _onChanged(value, language),
            ),
          )
          .toList(),
    );
  }

  _onChanged(bool? value, String language) {
    if (value != null && value == true) {
      setState(() {
        widget.languagesSelected.add(language);
      });
    } else {
      setState(() {
        widget.languagesSelected.remove(language);
      });
    }
  }
}
