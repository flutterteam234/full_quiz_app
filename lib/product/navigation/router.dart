import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_view.dart';
import 'package:riverpod_architecture/feature/splash/splash_view.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';

class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      return RouterItems.values
          .byName((settings.name ?? "/splash").substring(1))
          .goScreen();
    } catch (e) {
      return RouterItems.splash.goScreen(); // i.e Home Screen
    }
  }
}

extension PagesExtension on RouterItems {
  Widget _screen() {
    switch (this) {
      case RouterItems.quiz:
        return const QuizView();
      case RouterItems.splash:
        return const SplashView();
    }
  }

  String get routeName => "/$name";

  Route goScreen() => MaterialPageRoute(builder: (_) => _screen());
}
