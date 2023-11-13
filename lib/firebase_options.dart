// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJR2Od-js2jXjfRtZvqloWDd97KBF4Y60',
    appId: '1:883561617847:web:73c927d1b63433fd173032',
    messagingSenderId: '883561617847',
    projectId: 'quizapp-e7543',
    authDomain: 'quizapp-e7543.firebaseapp.com',
    storageBucket: 'quizapp-e7543.appspot.com',
    measurementId: 'G-DS9MXJDFJR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTR7yEuuJrMRBCQqY7RCUaaB-xAehjgf8',
    appId: '1:883561617847:android:a155943dab1cd7f4173032',
    messagingSenderId: '883561617847',
    projectId: 'quizapp-e7543',
    storageBucket: 'quizapp-e7543.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDv1VWfHuwKzkjt0V4P137EyS98XPlXnJQ',
    appId: '1:883561617847:ios:6965b1d56b48b323173032',
    messagingSenderId: '883561617847',
    projectId: 'quizapp-e7543',
    storageBucket: 'quizapp-e7543.appspot.com',
    iosBundleId: 'com.example.riverpodArchitecture',
  );
}
