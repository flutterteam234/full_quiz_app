import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:riverpod_architecture/feature/quiz/feature/quiz_view_mixin.dart';
import '../../../product/constants/color_constants.dart';
import '../model/questions.dart';
import '../provider/quiz_provider.dart';
import '../feature/quiz_view.dart';

class AnswerButton extends StatelessWidget with QuizViewMixin {
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
    final AnswerModel currentAnswerData =
        quizState.pastAnswersData[quizState.currentIndex];

    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (currentAnswerData.isPress) return;
          if (questionCheck(answerIndex, quizState.currentIndex)) {
            ref.read(quizProvider.notifier).setIsAnswerTrue();
          }
          ref.read(quizProvider.notifier).setSelectedAnswerIndex(answerIndex);
          ref.read(quizProvider.notifier).setIsPress();


        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<bool>(currentAnswerData.isPress),
            constraints: BoxConstraints(
              minHeight: context.sized.dynamicHeight(0.1),
            ),
            decoration: BoxDecoration(
              color: getAnswerContainerBackgroundColor(currentAnswerData),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: context.padding.onlyLeftLow + context.padding.onlyTopLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.visible,
                      getAnswerText(),
                      style: GoogleFonts.baloo2(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: getAnswerContainerTextColor(currentAnswerData),
                      ),
                    ),
                  ),
                  buildTrailingIcon(currentAnswerData),
                ],
              ),
            ),
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

  Widget buildTrailingIcon(AnswerModel currentAnswerData) {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && currentAnswerData.isPress) {
      return Icon(
        Icons.check_circle,
        color: Color(ColorConstants.ligthGreen.toRgba),
      );
    } else if (answerIndex == currentAnswerData.selectedAnswerIndex &&
        currentAnswerData.isPress) {
      return Icon(Icons.remove_circle_outline,
          color: Color(ColorConstants.darkRed.toRgba));
    } else {
      return const Icon(Icons.circle_outlined);
    }
  }

  Color getAnswerContainerBackgroundColor(AnswerModel currentAnswerData) {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && currentAnswerData.isPress) {
      return Color(ColorConstants.smootGreen.toRgba);
    } else if (answerIndex == currentAnswerData.selectedAnswerIndex &&
        currentAnswerData.isPress) {
      return Color(ColorConstants.lightRed.toRgba);
    } else {
      return Color(ColorConstants.white.toRgba);
    }
  }

  Color getAnswerContainerTextColor(AnswerModel currentAnswerData) {
    bool isQuestion =
        questionCheck(answerIndex, currentQuestion.correctQuestionIndex!);

    if (isQuestion && currentAnswerData.isPress) {
      return Color(ColorConstants.ligthGreen.toRgba);
    } else if (answerIndex == currentAnswerData.selectedAnswerIndex &&
        currentAnswerData.isPress) {
      return Color(ColorConstants.darkRed.toRgba);
    } else {
      return Color(ColorConstants.black.toRgba);
    }
  }
}
