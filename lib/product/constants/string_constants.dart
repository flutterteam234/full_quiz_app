import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();

  // App
  static const String appName = 'Quiz Biyoloji';

  // Pages
  static const home = 'Home';
  static const quiz = 'Quiz';

  // Login
  static const loginWelcome = 'Welcome 👋';
  static const loginWelcomeDetail = 'I am happy to see you';

  static const loginWelcomeBack = 'Welcome Back 👋';
  static const loginWelcomeBackDetail =
      'I am happy to see you again. You can continue where you left off by logging in';

  static const continueToApp = 'Continue to app';

  // Quiz
  static const provious = 'Previous';
  static const next = 'Next';

  // Leaderboard
  static const leaderboard = 'Leaderboard';

  // Home
  static const searchYourFavoritePlace = 'Search your favorite place...';

  // Top Picks
  static const topPicks = 'Top Picks';
  static const exploreProgrames = 'Let’s explore our programes';

  // 404
  static const ohNo = 'Oh No!';
  static const backtoHomePageLong =
      'May be bigfoot has broken this page. Come back to the homepage';
  static const backtoHomePageShort = 'Back to Homepage';

  // Error Messages
  static const nullUserName = 'null';
}
