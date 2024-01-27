import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const LocaleText({Key? key, required this.text, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text.locale, style: textStyle);
  }
}
