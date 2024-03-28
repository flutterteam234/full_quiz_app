import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/od/feature/od_view.dart';
import 'router_import.dart';

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
  Widget _screen({String? url, UnitQuestionsModel? unitQuestionsModel, String? path}) {
    switch (this) {
      case RouterItems.quiz:
        return QuizView(
          unitQuestionsModel: unitQuestionsModel,
        );
      case RouterItems.quizMain:
        return const QuizMainView();
      case RouterItems.splash:
        return const SplashView();
      case RouterItems.login:
        return const LoginPage();
      case RouterItems.register:
        return const RegisterPage();
      case RouterItems.leaderboard:
        return const LeaderboardView();
      case RouterItems.home:
        return const HomeView();
      case RouterItems.appNotifications:
        return const AppNotificationsView();
      case RouterItems.addPhoto:
        return const PPAdd();
      case RouterItems.appSettings:
        return const AppSettingsView();
      case RouterItems.editProfile:
        return const EditProfileView();
      case RouterItems.appPreference:
        return const AppPreferenceView();
      case RouterItems.appLanguage:
        return const AppLanguageView();
      case RouterItems.appNotes:
        return const AppNotesView();
      case RouterItems.pdfView:
        return PdfView(url: url);
      case RouterItems.verificationView:
        return const VerificationView();
      case RouterItems.odView:
        return OdView(path: path);
    }
  }

  Widget get page => _screen();

  String get routeName => "/$name";

  Route goScreen({String? url, UnitQuestionsModel? unitQuestionsModel, String? path}) =>
      MaterialPageRoute(
          builder: (_) =>
              _screen(url: url, unitQuestionsModel: unitQuestionsModel, path: path));
}
