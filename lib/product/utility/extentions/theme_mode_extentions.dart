import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';

extension ThemeModeExtentions on ThemeMode {
  String getThemeModeToString() {
    switch (this) {
      case ThemeMode.system:
        return SettingsConstants.themeModeLight;

      case ThemeMode.light:
        return SettingsConstants.themeModeLight;
      case ThemeMode.dark:
        return SettingsConstants.themeModeDark;
    }
  }
}
