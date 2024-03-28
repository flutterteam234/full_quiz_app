import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OdNotifier extends StateNotifier<OdState> with FirebaseUtility {
  OdNotifier() : super(const OdState());
}

class OdState {
  const OdState({this.isLoading = true});

  final bool isLoading;

  List<Object?> get props => [isLoading];

  OdState copyWith({
    bool? isLoading,
  }) {
    return OdState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
