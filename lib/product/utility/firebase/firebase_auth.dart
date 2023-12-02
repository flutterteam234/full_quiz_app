import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';

class AuthService {
  final userCollection = FirebaseCollections.users.reference;
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
    final UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) => print(e));
    User? user = userCredential.user;
    await user!.displayName;
    await user.reload();
    user = firebaseAuth.currentUser;

    // Kullanıcı verilerinin firestore a kayıt olmasını istersek burayı kullanabiliriz.

    FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set({
      "email": email,
      "name": name,
      "password": password,
    }).catchError((error) => print(error));

    Navigator.push(context, RouterItems.leaderboard.goScreen());

    return userCredential.user;
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (userCredential.user != null) {
        Navigator.push(context, RouterItems.leaderboard.goScreen());
      }
    } catch (e) {
      print("GİRİŞ YAPILAMADI");
    }
  }

  sendVerificationCode(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      // E-posta doğrulama kodu gönderildi, metni göster
      return true;
    } catch (e) {
      // Hata durumunda kullanıcıya bilgi verebilirsiniz
      print("Doğrulama kodu gönderme hatası: $e ");
    }
  }

  Future<void> sendEmailVerificationAgain() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
      // Tekrar doğrulama kodu gönderilmesi için.
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(context, RouterItems.leaderboard.goScreen());
    } else {
      Navigator.push(context, RouterItems.login.goScreen());
    }
  }
}
