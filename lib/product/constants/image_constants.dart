import 'package:flutter/material.dart';

enum ImageConstants {
  appIcon('logo'),
  leftRoundedIcon('left_rounded'),
  ;

  final String value;

  const ImageConstants(this.value);

  String get toIcon => 'assets/icons/ic_$value.png';

  String get toImage => 'assets/images/img_$value.png';

  Image get toImageAsset => Image.asset(toImage);

  Image get toIconAsset => Image.asset(toIcon);
}
