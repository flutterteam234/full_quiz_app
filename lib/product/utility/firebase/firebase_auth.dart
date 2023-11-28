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

      if (userCredential.user != null) {
        Navigator.push(context, RouterItems.leaderboard.goScreen());
      }
    } catch (e) {
      print("GİRİŞ YAPILAMADI");
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
