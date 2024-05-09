import 'package:flutter/cupertino.dart';

class SettingsConstants {
  SettingsConstants._();

  // General
  static const bool isShowDebugBanner = false;

  // Theme
  static const String themeModeLight = "LIGHT";
  static const String themeModeDark = "DARK";

  // Language
  static const SUPPORTED_LOCALE = [
    SettingsConstants.EN_LOCALE,
    SettingsConstants.TR_LOCALE,
  ];

  static const en = 'en';
  static const tr = 'tr';

  static const EN_LOCALE = Locale("en", "US");
  static const TR_LOCALE = Locale("tr", "TR");
  static const LANG_PATH = "assets/translations";

  static const startLocale = SettingsConstants.EN_LOCALE;

  static const defaultImagePath =
      "https://img.freepik.com/free-vector/error-lettering-font-typography_53876-99614.jpg?w=1380&t=st=1708180228~exp=1708180828~hmac=55b7f04179f619c53ea6aa3c449f7459c4d5f2fbff54ebacee157526e287a225";

  // Edit Profile
  static const int inputLenghtUsername = 15;
  static const int inputLenghtPassword = 15;

  // App Notes
  static const double zoomInLevel = 0.2;
  static const double zoomOutLevel = 0.2;

  // Points System
  static const int correctAnswerPoint = 10;

  // Verification
  static const int verificationLenght = 6;
  static const int verificationSecond = 180;
  static const TextInputType textInputType = TextInputType.number;

  /// If want the change textInputType you have to change something in VerificationState or App is not work

}
