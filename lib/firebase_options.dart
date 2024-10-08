// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyA9_ODa7hmBomaA9rYdf-fvBDKw7HG-_Is',
    appId: '1:654076807767:web:d626038a43b3936e133112',
    messagingSenderId: '654076807767',
    projectId: 'login-test-composedev',
    authDomain: 'login-test-composedev.firebaseapp.com',
    storageBucket: 'login-test-composedev.appspot.com',
    measurementId: 'G-H9EHY1828M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-_ON3enXCXBAGy4e9JLIdxzPomrAJeHw',
    appId: '1:654076807767:android:274f26b045536ce4133112',
    messagingSenderId: '654076807767',
    projectId: 'login-test-composedev',
    storageBucket: 'login-test-composedev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDByWiTrKjw4a850O1z0bEg20om5_8dB4o',
    appId: '1:654076807767:ios:abc93b85e3e941b1133112',
    messagingSenderId: '654076807767',
    projectId: 'login-test-composedev',
    storageBucket: 'login-test-composedev.appspot.com',
    iosBundleId: 'com.example.logIn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDByWiTrKjw4a850O1z0bEg20om5_8dB4o',
    appId: '1:654076807767:ios:abc93b85e3e941b1133112',
    messagingSenderId: '654076807767',
    projectId: 'login-test-composedev',
    storageBucket: 'login-test-composedev.appspot.com',
    iosBundleId: 'com.example.logIn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9_ODa7hmBomaA9rYdf-fvBDKw7HG-_Is',
    appId: '1:654076807767:web:9cb732a1c33e84c2133112',
    messagingSenderId: '654076807767',
    projectId: 'login-test-composedev',
    authDomain: 'login-test-composedev.firebaseapp.com',
    storageBucket: 'login-test-composedev.appspot.com',
    measurementId: 'G-YYRYH8L45F',
  );

}