import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: appColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
