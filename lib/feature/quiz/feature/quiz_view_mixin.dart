import 'package:flutter/cupertino.dart';


mixin QuizViewMixin on StatelessWidget {
  bool questionCheck(int questionIndex, int correctAnswerIndex) {
    if (questionIndex == correctAnswerIndex) {
      return true;
    } else {
      return false;
    }
  }
}
