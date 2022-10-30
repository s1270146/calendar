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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD9UA233WNLAUO_Irwp1aFemuTgCZmHJJM',
    appId: '1:939246742502:web:2d0da14968ed4c69d44427',
    messagingSenderId: '939246742502',
    projectId: 'calendar-c762b',
    authDomain: 'calendar-c762b.firebaseapp.com',
    storageBucket: 'calendar-c762b.appspot.com',
    measurementId: 'G-C7ZSSG1PCB',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASpKmLowzMElQaYjuPmxptvSfxkEEeC0I',
    appId: '1:939246742502:ios:b4b49d79e2c12103d44427',
    messagingSenderId: '939246742502',
    projectId: 'calendar-c762b',
    storageBucket: 'calendar-c762b.appspot.com',
    iosClientId: '939246742502-8dqij7m61190gd9ngl8tl3p2npfq7l4h.apps.googleusercontent.com',
    iosBundleId: 'calendar.myFirst20220910',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASpKmLowzMElQaYjuPmxptvSfxkEEeC0I',
    appId: '1:939246742502:ios:5757dcab6b250e1dd44427',
    messagingSenderId: '939246742502',
    projectId: 'calendar-c762b',
    storageBucket: 'calendar-c762b.appspot.com',
    iosClientId: '939246742502-kqqs82qflvih0hp6votk54ik1bh4aej0.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendar',
  );
}