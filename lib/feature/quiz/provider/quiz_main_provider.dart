import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/product/models/unitQuestionsModel.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

class QuizMainNotifier extends StateNotifier<QuizMainState>
    with FirebaseUtility {
  QuizMainNotifier() : super(const QuizMainState());

  Future<void> getUnitQuestions() async {
    final List<UnitQuestionsModel?>? unitQuestions = await fetchList(
        const UnitQuestionsModel(), FirebaseCollections.unitQuestions);
    if (unitQuestions != null) {
      addUnitQuestions(unitQuestions);
      setIsLoading(false);
    }
  }

  void addUnitQuestions(List<UnitQuestionsModel?> unitQuestions) {
    state = state.copyWith(unitQuestions: unitQuestions);
  }

  void setIsLoading(bool value){
    state = state.copyWith(isLoading: value);
  }
}

class QuizMainState {
  const QuizMainState({
    this.unitQuestions,
    this.isLoading = true,
  });

  final List<UnitQuestionsModel?>? unitQuestions;
  final bool isLoading;

  List<Object?> get props => [
        unitQuestions,
        isLoading,
      ];

  QuizMainState copyWith({
    List<UnitQuestionsModel?>? unitQuestions,
    bool? isLoading,
  }) {
    return QuizMainState(
      unitQuestions: unitQuestions ?? this.unitQuestions,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
