import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';

// fixme
// tamamlanıcak


class VerificationNotifier extends StateNotifier<VerificationState> {
  VerificationNotifier() : super(const VerificationState());

  void changeVerificationCode(int? value) {
    if (value == null) return;
    state = state.copyWith(verificationCode: value);
  }

  void changeVerificationSecond(int? value) {
    if (value == null) return;
    state = state.copyWith(verificationCode: value);
  }
}

class VerificationState {
  const VerificationState(
      {this.verificationCode,
      this.verificationSecond = SettingsConstants.verificationSecond});

  final int? verificationCode;
  final int verificationSecond;

  VerificationState copyWith({int? verificationCode}) {
    return VerificationState(
        verificationCode: verificationCode ?? this.verificationCode);
  }
}
