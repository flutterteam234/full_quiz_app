import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/initialize/app_start_init.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_utility.dart';

class SplashNotifier extends StateNotifier<SplashState> with FirebaseUtility {
  SplashNotifier() : super(const SplashState());

  Future<void> appInit() async {
    await ApplicationStart.init();
    // await Future.delayed(Duration(seconds: 5));
    setIsLoading(false);
  }


  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}

class SplashState {
  const SplashState({this.isLoading = true});

  final bool isLoading;

  List<Object?> get props => [
        isLoading,
      ];

  SplashState copyWith({
    bool? isLoading,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
