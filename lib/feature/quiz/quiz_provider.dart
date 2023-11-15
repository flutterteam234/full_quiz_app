import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/login/model/answers.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(const QuizState());

  void addQuestions(List<Questions?> questions) {
    state = state.copyWith(questions: questions);
  }
}

class QuizState {
  const QuizState({this.questions});

  final List<Questions?>? questions;

  List<Object?> get props => [questions];

  QuizState copyWith({
    List<Questions?>? questions,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
    );
  }
}
