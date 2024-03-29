import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/quiz/feature/quiz_main_view.dart';
import 'package:riverpod_architecture/feature/top_picks/top_picks_view.dart';
import '../../leaderboard/leaderboard_view.dart';

enum PageEnum { topPicks, quizMain, leaderboard }

extension HomePagesExtension on PageEnum {
  Widget _screen() {
    switch (this) {
      case PageEnum.quizMain:
        return const QuizMainView();
      case PageEnum.leaderboard:
        return const LeaderboardView();
      case PageEnum.topPicks:
        return const TopPicksView();
    }
  }

  Widget get page => _screen();

  String get routeName => "/$name";
}

extension RouterItemsExtension on PageEnum {
  int get id => index + 1;

  static PageEnum fromId(int id) {
    return PageEnum.values[id];
  }
}
