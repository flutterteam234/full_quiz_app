import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/notifier/app_theme_notifier.dart';
import 'package:riverpod_architecture/product/package/sharedPreferences/shared_preference_manager.dart';

mixin AppPreferenceMixin on ConsumerWidget {
  Future<void> toggleTheme(ThemeState themeState, ThemeMode themeMode) async{
    themeState.toggleTheme();
    await SharedPreferenceManager.instance.saveAppTheme(themeMode);
  }
}
