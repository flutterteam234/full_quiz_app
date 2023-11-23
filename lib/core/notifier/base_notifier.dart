import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/core/state/base_state.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier() : super(const BaseState());

}
