import 'package:flutter/material.dart';

enum ImageConstants {
  emailIcon('emailicon'),
  homeIcon('home'),
  playlistIcon('playlist'),
  trophyIcon('trophy'),
  ;

  final String value;

  const ImageConstants(this.value);

  String get toImage => 'assets/images/img_$value.png';
  String get toIcon => 'assets/icons/ic_$value.png';

  Image get toImageAsset => Image.asset(toImage);
  Image get toIconAsset => Image.asset(toIcon);
}
