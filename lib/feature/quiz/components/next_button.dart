import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({required this.quizProvider, required this.ref});

  final WidgetRef ref;
  final dynamic quizProvider; // fixme

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ref.read(quizProvider.notifier).nextQuestion();
      },
      child: Container(
        padding: context.padding.verticalLow,
        decoration: BoxDecoration(
          color: Color(ColorConstants.ligthGreen.toRgba),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(StringConstants.next,
            style: GoogleFonts.baloo2(
                fontSize: 18,
                color: Color(ColorConstants.white.toRgba),
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
