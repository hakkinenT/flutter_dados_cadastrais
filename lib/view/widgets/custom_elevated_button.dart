import 'package:flutter/material.dart';

import '../../utils/spaces.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    );

    return _CustomTextButtonBody(
      child: TextButton(
        style: style,
        onPressed: onPressed,
        child: const Text(
          'Salvar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _CustomTextButtonBody extends StatelessWidget {
  const _CustomTextButtonBody({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 48,
      child: child,
    );
  }
}
