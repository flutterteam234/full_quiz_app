import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText(
      {super.key,
      required this.text,
      required this.color,
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.alignment = TextAlign.start});

  final String text;
  final Color color;
  final TextAlign alignment;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: alignment,
      text,
      style: GoogleFonts.baloo2(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
