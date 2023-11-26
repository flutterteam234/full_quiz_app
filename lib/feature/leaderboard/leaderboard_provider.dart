import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_architecture/feature/quiz/model/questions.dart';
import 'package:riverpod_architecture/product/utility/exceptions/custom_exceptions.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

class LeaderboardNotifier extends StateNotifier<LeaderboardState>
    with FirebaseUtility {
  LeaderboardNotifier() : super(const LeaderboardState());

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

class LeaderboardState {
  const LeaderboardState({this.isLoading = false});

  final bool isLoading;

  List<Object?> get props => [isLoading];

  LeaderboardState copyWith({
    bool? isLoading,
  }) {
    return LeaderboardState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
