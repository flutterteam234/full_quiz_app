import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';

import '../../../product/constants/color_constants.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({required this.currentQuestion});

  final Questions? currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: context.padding.high,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -20,
            offset: const Offset(1, 1),
            color: Color(ColorConstants.black.toRgba),
          ),
        ],
        borderRadius: BorderRadius.circular(20.0),
        color: Color(ColorConstants.white.toRgba),
      ),
      child: Text(
        currentQuestion!.question!,
        style: GoogleFonts.baloo2(
            fontSize: 20,
            color: Color(ColorConstants.black.toRgba)),
      ),
    );
  }
}
