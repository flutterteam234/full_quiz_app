import 'package:flutter/material.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

class ShowDialogs {
  static void showMyDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: LocaleText(text: title),
          content:  LocaleText(text: title),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const LocaleText(text: LocaleKeys.general_close,)
            ),
          ],
        );
      },
    );
  }
}
