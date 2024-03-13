import 'package:flutter/material.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import '../text/locale_text.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, this.title, this.function, this.style})
      : super(key: key);

  final String? title;
  final Function()? function;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: style,
      onPressed: function,
      icon: const Icon(Icons.save),
      label: LocaleText(
          text: title != null ? title! : LocaleKeys.editProfile_save),
    );
  }
}
