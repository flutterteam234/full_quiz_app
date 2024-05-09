import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

@immutable
class AppTheme {
  const AppTheme._();

  // Theme work but i didn't use because i don´t have any desing for dark theme :((

  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: ColorConstants.smootGreen.getColor,
      appBarTheme: AppBarTheme(
        color: ColorConstants.smootWhite.getColor,
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: ColorConstants.smootGreen.getColor,
      appBarTheme: AppBarTheme(
        color: ColorConstants.smootWhite.getColor,
      ),
      backgroundColor: Colors.red,
    );
  }
}
