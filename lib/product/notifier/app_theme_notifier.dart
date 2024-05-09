import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeState, ThemeMode>((ref) {
  return ThemeState();
});



class ThemeState extends StateNotifier<ThemeMode> {
  ThemeState() : super(ThemeMode.light);

  void toggleTheme() {
    switch(state){
      case ThemeMode.system:
        state = ThemeMode.light;
        break;
      case ThemeMode.light:
        state = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        state = ThemeMode.light;
        break;
    }
  }

  void changeTheme(ThemeMode themeMode){
    state = themeMode;
  }

}