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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALKxm95tYqHGcOZKlh9VF0dHqFZ_Qw2Eg',
    appId: '1:583483955357:web:983b9dcd97766e982bdc74',
    messagingSenderId: '583483955357',
    projectId: 'warehouse-5a7b2',
    authDomain: 'warehouse-5a7b2.firebaseapp.com',
    storageBucket: 'warehouse-5a7b2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAa-5IQKE9pVbfbWd9Gk95hEI3-CHgAhec',
    appId: '1:583483955357:android:13b501a22ff29b172bdc74',
    messagingSenderId: '583483955357',
    projectId: 'warehouse-5a7b2',
    storageBucket: 'warehouse-5a7b2.appspot.com',
  );
}
