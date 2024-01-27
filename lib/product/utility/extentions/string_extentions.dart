import 'package:easy_localization/easy_localization.dart';

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
