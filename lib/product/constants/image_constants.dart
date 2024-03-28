import 'package:flutter/material.dart';

enum ImageConstants {
  appIcon('logo'),
  homePageTop1('home_page_top1'),
  homePageTop2('home_page_top2'),
  emailIcon('emailicon'),
  homeIcon('home'),
  playlistIcon('playlist'),
  trophyIcon('trophy'),
  error404Image('404'),
  leftRoundedIcon('left_rounded'),
  moonIcon('moon'),
  globalIcon('global'),
  logOutIcon('logout'),
  flagTr("flag_tr"),
  flagUs("flag_us"),
  warning("warning"),
  serverOff("server_off"),
  ;

  final String value;

  const ImageConstants(this.value);

  String get toImage => 'assets/images/img_$value.png';
  String get toIcon => 'assets/icons/ic_$value.png';

  Image get toImageAsset => Image.asset(toImage);
  Image get toIconAsset => Image.asset(toIcon);
}
