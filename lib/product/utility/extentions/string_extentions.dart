
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../constants/settings_constants.dart';

extension StringToEnum on String? {
  ThemeMode getAppModeEnum(String? themeModeString) {
    if (themeModeString == SettingsConstants.themeModeLight) {
      return ThemeMode.light;
    } else if (themeModeString == SettingsConstants.themeModeDark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}

extension StringInitialsExtension on String? {
  String getInitials() {
    if (this == null || this!.isEmpty) {
      return '';
    }

    List<String> nameParts = this!.split(" ");
    String initials = "";
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }
}

extension MaskingExtension on String? {
  String maskCharacters() {
    return this?.isEmpty ?? true ? "" : '*' * this!.length;
  }
}

extension StringLocalization on String {
  String get locale => this.tr();
}

extension StringToLocale on String {
  Locale getLocale() {
    switch (this) {
      case SettingsConstants.tr:
        return SettingsConstants.TR_LOCALE;
      case SettingsConstants.en:
        return SettingsConstants.EN_LOCALE;
      default:
        return SettingsConstants.startLocale;
    }
  }
}

extension Isurl on String {
  bool isURL() {
    final RegExp urlRegExp = RegExp(
      r"^(https?|ftp):\/\/[^\s\/$.?#].[^\s]*$",
      caseSensitive: false,
      multiLine: false,
    );
    return urlRegExp.hasMatch(this);
  }
}

extension FileExtensionCheck on String {
  bool isObjFile() {
    return toLowerCase().endsWith('.obj');
  }

  bool isGlbFile() {
    return toLowerCase().endsWith('.glb');
  }
}

extension RemoveSpaceString on String {
  String removeExtraSpaces() {
    var trimmed = trim();

    var singleSpaced = trimmed.replaceAll(RegExp(r'\s+'), ' ');

    return singleSpaced;
  }
}
