import 'package:flutter/material.dart';

enum ColorConstants {
  ligthGreen('004643'),
  lightSilver('EEEFF2'),
  white('FFFFFF'),
  black('000000 '),
  ligthGrey('EFF0F3'),
  smootGreen('ABD1C6'),
  darkGreen('184a14'),
  lightRed('f7a59c'),
  darkRed('e8685a'),
  smootWhite('EFF0F3'),
  yellow('FFD912'),
  darkBlue('102C56'),
  lightGreyText('8A94A4'),
  test('e4f2e4')
  ;

  final String value;

  const ColorConstants(this.value);

  int get toRgba => int.parse('0xFF$value');

  Color get getColor => Color(toRgba);
}
