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
