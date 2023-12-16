import 'package:flutter/material.dart';

enum TextFamilyConstrants {
  bodyLarge(Colors.white, 16),
  titleLarge(Colors.white, 30),
  bodyMedium(Colors.white, 14),
  bodyLargeBlack(Colors.black, 16),
  titleLargeBlack(Colors.black, 30),
  bodyMediumBlack(Colors.black, 14),
  ;

  final Color color;
  final double fontSize;

  const TextFamilyConstrants(this.color, this.fontSize);

  TextStyle get getFont => TextStyle(color: color, fontSize: fontSize);
}
