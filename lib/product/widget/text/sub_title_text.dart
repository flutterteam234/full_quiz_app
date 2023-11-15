import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText(
      {super.key,
      required this.text,
      required this.color,
      this.alignment = TextAlign.start});

  final String text;
  final Color color;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: alignment,
      text,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
