import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../product/constants/color_constants.dart';
import '../model/questions.dart';
import '../quiz_provider.dart';
import '../quiz_view.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {Key? key,
      required this.ref,
      required this.quizProvider,
      required this.quizState,
      required this.currentQuestion,
      required this.answerIndex})
      : super(key: key);

  final dynamic quizProvider; // fixme
  final WidgetRef ref;
  final QuizState quizState;
  final Questions currentQuestion;
  final int answerIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (quizState.isPress) return;
          if (questionCheck(answerIndex, quizState.currentIndex)) {
            ref.read(quizProvider.notifier).setIsAnswerTrue();
          }
          ref.read(quizProvider.notifier).setSelectedAnswerIndex(answerIndex);
          ref.read(quizProvider.notifier).setIsPress();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
                key: ValueKey<bool>(quizState.isPress),
                decoration: BoxDecoration(
                    color: getAnswerContainerBackgroundColor(),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                    leading: Text(
                      getAnswerText(),
                      style: GoogleFonts.baloo2(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: getAnswerContainerTextColor(),
                      ),
                    ),
                    trailing: buildTrailingIcon())),
          ),
        ));
  }

  String getAnswerText() {
    if (answerIndex == 0) {
      return currentQuestion.answers!.s1!;
    } else if (answerIndex == 1) {
      return currentQuestion.answers!.s2!;
    } else if (answerIndex == 2) {
      return currentQuestion.answers!.s3!;
    } else if (answerIndex == 3) {
      return currentQuestion.answers!.s4!;
    } else {
      return "Wrong Index Number";
    }
  }

  Widget buildTrailingIcon() {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && quizState.isPress) {
      return Icon(
        Icons.check_circle,
        color: Color(ColorConstants.ligthGreen.toRgba),
      );
    } else if (answerIndex == quizState.selectedAnswerIndex &&
        quizState.isPress) {
      return Icon(Icons.remove_circle_outline,
          color: Color(ColorConstants.darkRed.toRgba));
    } else {
      return const Icon(Icons.circle_outlined);
    }
  }

  Color getAnswerContainerBackgroundColor() {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && quizState.isPress) {
      return Color(ColorConstants.smootGreen.toRgba);
    } else if (answerIndex == quizState.selectedAnswerIndex &&
        quizState.isPress) {
      return Color(ColorConstants.lightRed.toRgba);
    } else {
      return Color(ColorConstants.white.toRgba);
    }
  }

  Color getAnswerContainerTextColor() {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && quizState.isPress) {
      return Color(ColorConstants.ligthGreen.toRgba);
    } else if (answerIndex == quizState.selectedAnswerIndex &&
        quizState.isPress) {
      return Color(ColorConstants.darkRed.toRgba);
    } else {
      return Color(ColorConstants.black.toRgba);
    }
  }
}
