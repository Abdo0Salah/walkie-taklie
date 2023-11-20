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
        return macos;
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
    apiKey: 'AIzaSyCmG3mYGTQ4-cdw2BV47s3ZlWw7X_Lw0Mo',
    appId: '1:224572393117:web:0c9e524f9abcdcaf2eb674',
    messagingSenderId: '224572393117',
    projectId: 'walkie-taklie-7dcc1',
    authDomain: 'walkie-taklie-7dcc1.firebaseapp.com',
    storageBucket: 'walkie-taklie-7dcc1.appspot.com',
    measurementId: 'G-9L3P7M9J7L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADtm1Oq829uGOTcDaE1EUU9Sk1uPpVQTg',
    appId: '1:224572393117:android:3d775ef86d6e6da62eb674',
    messagingSenderId: '224572393117',
    projectId: 'walkie-taklie-7dcc1',
    storageBucket: 'walkie-taklie-7dcc1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMDBK6ziix9mYRLfDeWgiy2iRk4FTyzv8',
    appId: '1:224572393117:ios:79d614ee195aa3352eb674',
    messagingSenderId: '224572393117',
    projectId: 'walkie-taklie-7dcc1',
    storageBucket: 'walkie-taklie-7dcc1.appspot.com',
    iosBundleId: 'com.example.walkieTaklieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMDBK6ziix9mYRLfDeWgiy2iRk4FTyzv8',
    appId: '1:224572393117:ios:d0d95e80d2ad6e2c2eb674',
    messagingSenderId: '224572393117',
    projectId: 'walkie-taklie-7dcc1',
    storageBucket: 'walkie-taklie-7dcc1.appspot.com',
    iosBundleId: 'com.example.walkieTaklieApp.RunnerTests',
  );
}