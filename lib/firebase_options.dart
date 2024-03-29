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
    apiKey: 'AIzaSyAE9ZZXEnQv-ZylK9qbNETWTTBDbTwippA',
    appId: '1:88565517867:web:3bdfb8539024ac6e12646e',
    messagingSenderId: '88565517867',
    projectId: 'snippet-2b962',
    authDomain: 'snippet-2b962.firebaseapp.com',
    storageBucket: 'snippet-2b962.appspot.com',
    measurementId: 'G-KV94E9FNXT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCP5NqcAySP8z0m5ES40X_dEr8JDAg70O4',
    appId: '1:88565517867:android:96a7c341a046e27412646e',
    messagingSenderId: '88565517867',
    projectId: 'snippet-2b962',
    storageBucket: 'snippet-2b962.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBz5XwsEaKBOnH6mXfaIPGZM9rOAgRDAPA',
    appId: '1:88565517867:ios:3684ec72e29fb71512646e',
    messagingSenderId: '88565517867',
    projectId: 'snippet-2b962',
    storageBucket: 'snippet-2b962.appspot.com',
    iosBundleId: 'com.example.snippet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBz5XwsEaKBOnH6mXfaIPGZM9rOAgRDAPA',
    appId: '1:88565517867:ios:0149f4a9bdf6747312646e',
    messagingSenderId: '88565517867',
    projectId: 'snippet-2b962',
    storageBucket: 'snippet-2b962.appspot.com',
    iosBundleId: 'com.example.snippet.RunnerTests',
  );
}
