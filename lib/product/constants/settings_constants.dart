import 'dart:ui';

class SettingsConstants {
  SettingsConstants._();

  // General
  static const bool isShowDebugBanner = false;

  // Language
  static const SUPPORTED_LOCALE = [
    SettingsConstants.EN_LOCALE,
  ];

  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "assets/translations";

  // Edit Profile
  static const int inputLenghtUsername = 15;
  static const int inputLenghtPassword = 15;
}
