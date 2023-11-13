import 'package:flutter/material.dart';

enum ImageConstants {
  appIcon('logo');

  final String value;

  const ImageConstants(this.value);

  String get toPng => 'assets/icons/ic_$value.png';

  Image get toImage => Image.asset(toPng);
}
