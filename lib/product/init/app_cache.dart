import 'dart:ui';

import 'package:riverpod_architecture/feature/app_language/enum/language_enum.dart';
import 'package:riverpod_architecture/product/enum/cache_items.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();

  static AppCache instance = AppCache._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;

  Future<void> saveLanguage(LanguageEnum languageEnum) async{
    await CacheItems.language.write(languageEnum.getStringFromEnum());
  }

  Locale getLanguage(){
    String currentLang = CacheItems.language.read;
    Locale locale = currentLang.getLocale();
    return locale;
  }
}
