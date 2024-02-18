import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_collections.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../navigation/enum/router_items.dart';

class AuthService {
  final userCollection = FirebaseCollections.users.reference;
  final firebaseAuth = FirebaseAuth.instance;
  User? _currentUser;

  User? get currentUser => _currentUser;

  AuthService() {
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  Future<User?> signUp(BuildContext context,
      {required String name,
      required String email,
      required String password,
      File? imageFile}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) => print(e));
      User? user = userCredential.user;
      await user!.displayName;
      await user.reload();

      // Fotoğrafı Firebase Storage'a yükle
      if (imageFile != null) {
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${user.uid}.jpg');

        await ref.putFile(imageFile);
        String photoURL = await ref.getDownloadURL();

        // Firestore'a fotoğrafın URL'sini kaydet
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "email": email,
          "name": name,
          "password": password,
          "photoURL": photoURL, // Fotoğrafın URL'sini Firestore'a kaydet
        });
      } else {
        // Kullanıcı verilerinin firestore a kayıt olmasını istersek burayı kullanabiliriz.
        FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "email": email,
          "name": name,
          "password": password,
        }).catchError((error) => print(error));
      }
      Navigator.push(context, RouterItems.home.goScreen());

      return userCredential.user;
    } catch (e) {
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorConstants.black.getColor,
            title: Text("Kullanıcı mevcut",
                style: TextFamilyConstrants.bodyLarge.getFont),
            content: Text("Bu kullanıcı zaten bulunuyor.",
                style: TextFamilyConstrants.bodyMedium.getFont),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, RouterItems.login.goScreen());
                },
                child: Text("Tamam",
                    style: TextFamilyConstrants.bodyLarge.getFont),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (userCredential.user != null) {
        Navigator.push(context, RouterItems.home.goScreen());
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

  // Kullanıcı doğrulamasını kontrol etmek için
  bool checkEmailVerification(String email) {
    User? user = FirebaseAuth.instance.currentUser;
    print(user.toString() + "  HAHAHAHHAHAHAHHA");
    if (user != null && user.emailVerified) {
      // Kullanıcı doğrulanmış bir e-posta adresine sahip
      print('E-posta doğrulandı.');
      return true;
    } else {
      // Kullanıcı henüz e-posta doğrulamasını tamamlamadı
      AuthService().sendVerificationCode(email);
      print('E-posta doğrulama gönderildi.');
      return false;
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    //AuthService();
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.push(context, RouterItems.quizMain.goScreen());
    } else {
      Navigator.push(context, RouterItems.login.goScreen());
    }
  }
}
