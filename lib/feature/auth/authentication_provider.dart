import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_architecture/product/enum/cache_items.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(const AuthenticationState());

  Future<void> fetchUserDetail(User? user) async {
    if (user == null) return;
    final token = await user.getIdToken();
    await tokenSaveToCache(token.toString());
    state = state.copyWith(isRedirect: true);
  }

  Future<void> tokenSaveToCache(String token) async {
    await CacheItems.token.write(token);
  }
}

class AuthenticationState {
  const AuthenticationState({this.isRedirect = false});

  final bool isRedirect;

  List<Object> get props => [isRedirect];

  AuthenticationState copyWith({
    bool? isRedirect,
  }) {
    return AuthenticationState(
      isRedirect: isRedirect ?? this.isRedirect,
    );
  }
}
