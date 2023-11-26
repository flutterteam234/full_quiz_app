import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/feature/leaderboard/leaderboard_view.dart';
import 'package:riverpod_architecture/feature/quiz/quiz_view.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  Future<User?> signUp(BuildContext context,
      {required String name,
      required String email,
      required String password}) async {
    final navogator = Navigator.of(context);

    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) => print(e));
    User? user = userCredential.user;
    await user!.displayName;
    await user.reload();
    user = firebaseAuth.currentUser;

    // Kullanıcı verilerinin firestore a kayıt olmasını istersek burayı kullanabiliriz.
/*
    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set({
      "email": email,
      "name": name,
      "password": password,
    }).catchError((error) => print(error));
    */
    navogator.push(MaterialPageRoute(builder: (context) => const LeaderboardView()));
    return userCredential.user;
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navogator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        // giriş başarılı gardaş
        navogator
            .push(MaterialPageRoute(builder: (context) => const LeaderboardView()));
      }
    } catch (e) {
      print("GİRİŞ YAPILAMADI");
    }
  }
}
