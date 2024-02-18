import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLanguageNotifier extends StateNotifier<AppLanguageState> {
  AppLanguageNotifier() : super(const AppLanguageState());


}

class AppLanguageState {
  const AppLanguageState({this.selectedLang});

  final Locale? selectedLang;

  List<Object?> get props => [selectedLang];

  AppLanguageState copyWith({
    Locale? selectedLang,
  }) {
    return AppLanguageState(
      selectedLang: selectedLang ?? this.selectedLang,
    );
  }
}
