import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        WavyAnimatedText(title,
            textStyle: GoogleFonts.baloo2(
              color: Color(ColorConstants.white.toRgba),
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
