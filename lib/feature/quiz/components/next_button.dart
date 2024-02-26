import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/quiz/provider/quiz_provider.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/services/ConnectionChange/connection_change_enum.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {Key? key,
      required this.quizProvider,
      required this.ref,
      required this.networkResult})
      : super(key: key);

  final WidgetRef ref;
  final StateNotifierProvider<QuizNotifier, QuizState> quizProvider;
  final NetworkResult networkResult;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ref.read(quizProvider.notifier).nextQuestion();
        ref.read(quizProvider.notifier).savePoints(networkResult);
      },
      child: Container(
        padding: context.padding.verticalLow,
        decoration: BoxDecoration(
          color: Color(ColorConstants.ligthGreen.toRgba),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: LocaleText(
            text: LocaleKeys.quiz_next,
            textStyle: GoogleFonts.baloo2(
                fontSize: 18,
                color: Color(ColorConstants.white.toRgba),
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
