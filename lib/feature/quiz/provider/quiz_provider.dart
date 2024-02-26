import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/quiz/model/questions.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/models/unitQuestionsModel.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/extentions/time_extentions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';
import '../../../product/services/ConnectionChange/connection_change_enum.dart';
import '../../leaderboard/model/points.dart';

class QuizNotifier extends StateNotifier<QuizState> with FirebaseUtility {
  QuizNotifier() : super(const QuizState());

  Future<void> savePoints(NetworkResult networkResult) async {
    if (networkResult.getIsConnected) {
      for (AnswerModel answerModel in state.pastAnswersData) {
        if (answerModel.isAnswerTrue) {
          Points points = Points(
              date: DateTimeExtensions.currentTimestamp(),
              point: SettingsConstants.correctAnswerPoint);
          addDocument(points, FirebaseCollections.points.reference);
        }
      }
    } else {
      // save localdatabase
    }
  }

  Future<void> loadQuestions(UnitQuestionsModel? unitQuestionsModel) async {
    try {
      if (unitQuestionsModel == null) return;

      final List<Questions?> questionList = [];
      for (String value in unitQuestionsModel.documentIds!) {
        final Questions? questions = await fetchDocument<Questions, Questions>(
            value, Questions(), FirebaseCollections.questions);
        if (questions == null) return;
        questionList.add(questions);
      }
      addQuestions(questionList);
      addAnswerData();

      await Future.delayed(const Duration(seconds: 1));
      setLoading(false);
    } catch (error) {
      throw FirebaseCustomExceptions('$error null');
    }
  }

  void addAnswerData() {
    if (state.questions != null) {
      final List<AnswerModel> newAnswers = List.generate(
        state.questions!.length,
        (index) => AnswerModel(
          isAnswerTrue: false,
          selectedAnswerIndex: 4,
          isPress: false,
        ),
      );

      state = state
          .copyWith(pastAnswersData: [...state.pastAnswersData, ...newAnswers]);
    }
  }

  void addQuestions(List<Questions?> questions) {
    state = state.copyWith(questions: questions);
  }

  void nextQuestion() {
    if (state.currentIndex >= state.questions!.length - 1) return;
    state = state.copyWith(currentIndex: state.currentIndex + 1);
  }

  void previousQuestion() {
    if (state.currentIndex <= 0) return;
    state = state.copyWith(currentIndex: state.currentIndex - 1);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setSelectedAnswerIndex(int index) {
    if (index < 0 || index > 4) return;
    final List<AnswerModel> updatedPastAnswersData =
        List.from(state.pastAnswersData);
    updatedPastAnswersData[state.currentIndex] =
        updatedPastAnswersData[state.currentIndex] = AnswerModel(
      isAnswerTrue: updatedPastAnswersData[state.currentIndex].isAnswerTrue,
      selectedAnswerIndex: index,
      isPress: updatedPastAnswersData[state.currentIndex].isPress,
    );

    state = state.copyWith(pastAnswersData: updatedPastAnswersData);
  }

  void setIsAnswerTrue() {
    final List<AnswerModel> updatedPastAnswersData =
        List.from(state.pastAnswersData);
    updatedPastAnswersData[state.currentIndex] =
        updatedPastAnswersData[state.currentIndex] = AnswerModel(
      isAnswerTrue: !updatedPastAnswersData[state.currentIndex].isAnswerTrue,
      selectedAnswerIndex:
          updatedPastAnswersData[state.currentIndex].selectedAnswerIndex,
      isPress: updatedPastAnswersData[state.currentIndex].isPress,
    );
    state = state.copyWith(pastAnswersData: updatedPastAnswersData);
  }

  void setIsPress() {
    final List<AnswerModel> updatedPastAnswersData =
        List.from(state.pastAnswersData);
    updatedPastAnswersData[state.currentIndex] =
        updatedPastAnswersData[state.currentIndex] = AnswerModel(
      isAnswerTrue: updatedPastAnswersData[state.currentIndex].isAnswerTrue,
      selectedAnswerIndex:
          updatedPastAnswersData[state.currentIndex].selectedAnswerIndex,
      isPress: !updatedPastAnswersData[state.currentIndex].isPress,
    );
    state = state.copyWith(pastAnswersData: updatedPastAnswersData);
  }
}

class QuizState {
  const QuizState({
    this.questions,
    this.pastAnswersData = const [],
    this.isLoading = true,
    this.currentIndex = 0,
  });

  final List<Questions?>? questions;
  final List<AnswerModel> pastAnswersData;
  final bool isLoading;
  final int currentIndex;

  List<Object?> get props => [
        questions,
        pastAnswersData,
        isLoading,
        currentIndex,
      ];

  QuizState copyWith({
    List<Questions?>? questions,
    List<AnswerModel>? pastAnswersData,
    bool? isLoading,
    int? currentIndex,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      pastAnswersData: pastAnswersData ?? this.pastAnswersData,
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class AnswerModel {
  final bool isAnswerTrue;
  final int selectedAnswerIndex;
  final bool isPress;

  AnswerModel({
    required this.isAnswerTrue,
    required this.selectedAnswerIndex,
    required this.isPress,
  });
}
