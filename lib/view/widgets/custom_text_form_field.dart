import 'package:flutter/material.dart';

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
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.black38),
        errorText: errorText,
        suffixIcon: suffixIcon,
        border: border,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: border,
        enabledBorder: border,
      ),
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
