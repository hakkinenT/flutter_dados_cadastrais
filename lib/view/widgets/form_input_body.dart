import 'package:flutter/material.dart';

class FormInputBody extends StatelessWidget {
  const FormInputBody({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
