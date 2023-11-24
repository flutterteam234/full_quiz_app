import 'package:flutter/material.dart';

enum TextFamilyConstrants {
  bodyLarge(Colors.white, 16),
  titleLarge(Colors.white, 12),
  ;

  final Color color;
  final double fontSize;

  const TextFamilyConstrants(this.color, this.fontSize);

  TextStyle get getFont => TextStyle(color: color, fontSize: fontSize);
}
