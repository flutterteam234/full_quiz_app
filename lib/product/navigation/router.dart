import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_view.dart';
import 'package:riverpod_architecture/feature/splash/splash_view.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';



class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      return Pages.values
          .byName((settings.name ?? "/page1").substring(1))
          .goScreen();
    } catch (e) {
      return Pages.splash.goScreen(); // i.e Home Screen
    }
  }
}

extension PagesExtension on Pages {
  Widget _screen() {
    switch (this) {
      case Pages.quiz:
        return const QuizView();
      case Pages.splash:
        return const SplashView();
    }
  }

  String get routeName => "/$name";

  Route goScreen() => MaterialPageRoute(builder: (_) => _screen());
}