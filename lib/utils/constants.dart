import 'package:flutter/material.dart';

final Color appColor = Colors.teal.shade100;
final backgroundColor = Color.alphaBlend(
    const Color.fromRGBO(0, 150, 136, 0.08), const Color(0xFF121212));
final surfaceColor = Color.alphaBlend(
    const Color.fromRGBO(0, 150, 136, 0.15), const Color(0xFF121212));

const double heightSpace = 16.0;
const double paddingSpace = 24.0;
const double borderRadius = 10.0;

List<String> levels = const ['Iniciante', 'Intermediário', 'Avançado'];
List<String> languages = const [
  'Dart',
  'C##',
  'C++',
  'Java',
  'Javascript',
  'Python'
];
