import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/app_language/enum/language_enum.dart';
import 'package:riverpod_architecture/product/enum/cache_items.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:riverpod_architecture/product/utility/extentions/theme_mode_extentions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  SharedPreferenceManager._();

  static SharedPreferenceManager instance = SharedPreferenceManager._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;

  Future<void> saveLanguage(LanguageEnum languageEnum) async {
    await CacheItems.language.write(languageEnum.getStringFromEnum());
  }

  Future<void> saveAppTheme(ThemeMode themeMode) async {
    print(themeMode);
    print("kaydoldu");
    await CacheItems.themeMode.write(themeMode.getThemeModeToString());
  }

  ThemeMode getAppMode() {
    String? themeModeString = CacheItems.themeMode.read;
    ThemeMode themeMode = themeModeString.getAppModeEnum(themeModeString);
    print("theme Mode:");
    print(themeMode);

    return themeMode;
  }

  Locale getLanguage() {
    String currentLang = CacheItems.language.read;
    Locale locale = currentLang.getLocale();
    return locale;
  }
}
