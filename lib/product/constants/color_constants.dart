import 'package:flutter/material.dart';

enum ColorConstants {
  ligthGreen('004643'),
  lightSilver('EEEFF2'),
  white('FFFFFF'),
  ;

  final String value;

  const ColorConstants(this.value);

  int get toRgba => int.parse('0xFF$value');

  Color get getColor => Color(toRgba);
}
