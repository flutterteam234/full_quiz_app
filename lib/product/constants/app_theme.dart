import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static ThemeData getAppTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: ColorConstants.smootWhite.getColor,
      appBarTheme: AppBarTheme(
        color: ColorConstants.smootWhite.getColor,
      ),

    );
  }
}
