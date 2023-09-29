import 'package:flutter/material.dart';

class SalarySlider extends StatelessWidget {
  const SalarySlider({
    super.key,
    required this.value,
    this.onChanged,
  });

  final double value;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 10000,
      value: value,
      onChanged: onChanged,
    );
  }
}
