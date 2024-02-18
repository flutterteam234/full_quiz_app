import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/utility/extentions/string_extentions.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const LocaleText(
      {Key? key, required this.text, this.textStyle, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

// When you call this component use like that :
// - LocaleText(text: LocaleKeys.appName, textStyle: TextStyle() );  for ex.
