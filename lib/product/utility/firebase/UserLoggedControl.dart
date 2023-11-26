import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';

// Giriş durumunu kontrol etmek için bir metot
Future<void> checkLoginStatus(BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    // Kullanıcı zaten giriş yapmış, ana ekrana yönlendir
    Navigator.push(context, RouterItems.quiz.goScreen());
  } else {
    // Kullanıcı giriş yapmamış, login ekranını göster
    Navigator.push(context, RouterItems.login.goScreen());
  }
}
