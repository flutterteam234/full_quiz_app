import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/app_notifications/app_notifications_view.dart';
import 'package:riverpod_architecture/feature/app_settings/app_settings_view.dart';
import 'package:riverpod_architecture/feature/edit_profile/edit_profile_view.dart';
import 'package:riverpod_architecture/feature/home/home_view.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_view.dart';
import 'package:riverpod_architecture/feature/login_register/login_page.dart';
import 'package:riverpod_architecture/feature/login_register/profile_photo_add.dart';
import 'package:riverpod_architecture/feature/login_register/register_page.dart';
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
    }
  }

  Widget get page => _screen();

  String get routeName => "/$name";

  Route goScreen() => MaterialPageRoute(builder: (_) => _screen());
}
