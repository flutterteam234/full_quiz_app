import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/login/model/answers.dart';
import 'package:riverpod_architecture/feature/login/model/questions.dart';

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(const QuizState());

  void addQuestions(List<Questions?> questions) {
    state = state.copyWith(
        questions: questions,
        isLoading: true,
        currentIndex: 1,
        isAnswerTrue: false,
        selectedAnswerIndex: 0);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setSelectedAnswerIndex(int index) {
    if(index < 0 || index > 4) return;
    state = state.copyWith(selectedAnswerIndex: index);
  }

  void setIsAnswerTrue() {
    state = state.copyWith(isAnswerTrue: !state.isAnswerTrue);
  }
}

class QuizState {
  const QuizState(
      {this.questions,
      this.isLoading = true,
      this.currentIndex = 1,
      this.isAnswerTrue = false,
      this.selectedAnswerIndex = 0});

  final List<Questions?>? questions;
  final bool isLoading;
  final int currentIndex;
  final bool isAnswerTrue;
  final int selectedAnswerIndex;

  List<Object?> get props =>
      [questions, isLoading, currentIndex, isAnswerTrue, selectedAnswerIndex];

  QuizState copyWith({
    List<Questions?>? questions,
    bool? isLoading,
    int? currentIndex,
    bool? isAnswerTrue,
    int? selectedAnswerIndex,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
      isAnswerTrue: isAnswerTrue ?? this.isAnswerTrue,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
    );
  }
}
