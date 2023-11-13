import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.text,
    required this.color,
    this.alignment = TextAlign.start,
    super.key,
  });

  final String text;
  final Color color;
  final TextAlign alignment;


  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: alignment,

      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
