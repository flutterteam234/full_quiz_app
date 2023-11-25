import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_architecture/firebase_options.dart';
import 'package:riverpod_architecture/product/initialize/app_cache.dart';


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

    await AppCache.instance.setup();
    //await Future.delayed(Duration(seconds: 5));
  }
}
