import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_architecture/firebase_options.dart';
import 'package:riverpod_architecture/product/initialize/app_cache.dart';
import 'package:riverpod_architecture/product/utility/firebase/firebase_user.dart';

class ApplicationStart {
  const ApplicationStart._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders(
      [EmailAuthProvider()],
    );

    FirebaseUser firebaseUser = FirebaseUser.instance;
    await firebaseUser.getUserDataById();

    await Future.delayed(const Duration(seconds: 1));
  }
}
