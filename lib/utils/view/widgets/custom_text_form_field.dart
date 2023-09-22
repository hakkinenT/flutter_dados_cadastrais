import 'package:flutter/material.dart';
import 'package:flutter_dados_cadastrais/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.errorText,
    this.autofocus = false,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorText;
  final bool autofocus;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: appColor),
      borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
    );

    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white30),
          errorText: errorText,
          suffixIcon: suffixIcon,
          suffixIconColor: appColor,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          )),
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
