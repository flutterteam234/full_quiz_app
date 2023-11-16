import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/login/model/answers.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(const QuizState());

  void addQuestions(List<Questions?> questions) {
    state =
        state.copyWith(questions: questions, isLoading: true, currentIndex: 1);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

class QuizState {
  const QuizState(
      {this.questions, this.isLoading = true, this.currentIndex = 1});

  final List<Questions?>? questions;
  final bool isLoading;
  final int currentIndex;

  List<Object?> get props => [questions, isLoading, currentIndex];

  QuizState copyWith({
    List<Questions?>? questions,
    bool? isLoading,
    int? currentIndex,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
