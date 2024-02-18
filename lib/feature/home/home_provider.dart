import 'package:riverpod/riverpod.dart';
import '../../product/utility/firebase/firebase_utility.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  void changePage(int index){
    state = state.copyWith(pageIndex: index);
  }

}

class HomeState {
  const HomeState({
    this.pageIndex = 0,
  });

  final int pageIndex;

  List<Object?> get props => [
        pageIndex,
      ];

  HomeState copyWith({
    int? pageIndex,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
