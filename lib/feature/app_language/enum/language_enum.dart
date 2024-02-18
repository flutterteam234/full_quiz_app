import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';

enum LanguageEnum {
  tr,
  en,
}

extension LanguageExtentions on LanguageEnum {
  Locale _getLocaleFromEnum() {
    switch (this) {
      case LanguageEnum.en:
        return SettingsConstants.EN_LOCALE;
      case LanguageEnum.tr:
        return SettingsConstants.TR_LOCALE;
    }
  }

   String getStringFromEnum() {
    switch (this) {
      case LanguageEnum.en:
        return SettingsConstants.en;
      case LanguageEnum.tr:
        return SettingsConstants.tr;
    }
  }

  void generateLanguage(BuildContext context) {
    context.locale = _getLocaleFromEnum();
  }
}
