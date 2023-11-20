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
        currentIndex: 0,
        isAnswerTrue: false,
        selectedAnswerIndex: 4,
        isPress: false);
  }

  void nextQuestion() {
    if (state.currentIndex >= state.questions!.length - 1) return;
    state = state.copyWith(currentIndex: state.currentIndex + 1);
    resetVeriables();
  }

  void previousQuestion() {
    if (state.currentIndex <= 0) return;
    state = state.copyWith(currentIndex: state.currentIndex - 1);
    resetVeriables();
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setSelectedAnswerIndex(int index) {
    if (index < 0 || index > 4) return;
    state = state.copyWith(selectedAnswerIndex: index);
  }

  void setIsAnswerTrue() {
    state = state.copyWith(isAnswerTrue: !state.isAnswerTrue);
  }

  void setIsPress() {
    state = state.copyWith(isPress: !state.isPress);
  }

  void resetVeriables() {
    state = state.copyWith(
        isPress: false, isAnswerTrue: false, selectedAnswerIndex: 4);
  }
}

class QuizState {
  const QuizState({this.questions,
    this.isLoading = true,
    this.currentIndex = 0,
    this.isAnswerTrue = false,
    this.selectedAnswerIndex = 4,
    this.isPress = false});

  final List<Questions?>? questions;
  final bool isLoading;
  final int currentIndex;
  final bool isAnswerTrue;
  final int selectedAnswerIndex;
  final bool isPress;

  List<Object?> get props =>
      [
        questions,
        isLoading,
        currentIndex,
        isAnswerTrue,
        selectedAnswerIndex,
        isPress
      ];

  QuizState copyWith({
    List<Questions?>? questions,
    bool? isLoading,
    int? currentIndex,
    bool? isAnswerTrue,
    int? selectedAnswerIndex,
    bool? isPress,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
      isAnswerTrue: isAnswerTrue ?? this.isAnswerTrue,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
      isPress: isPress ?? this.isPress,
    );
  }
}
