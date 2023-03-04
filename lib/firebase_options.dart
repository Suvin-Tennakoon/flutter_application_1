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
    apiKey: 'AIzaSyAk-JYhtx09QQKb27vJxAEo3FO0ZPJUlaQ',
    appId: '1:1078172486002:web:9d659618e5907252a535eb',
    messagingSenderId: '1078172486002',
    projectId: 'newprojtest1',
    authDomain: 'newprojtest1.firebaseapp.com',
    storageBucket: 'newprojtest1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoA0Mcvc8MHJsCQQ9cYV-QmLCeMCwApr0',
    appId: '1:1078172486002:android:a4aadd86140317aaa535eb',
    messagingSenderId: '1078172486002',
    projectId: 'newprojtest1',
    storageBucket: 'newprojtest1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDB23q-tIuDjXghm-B59a6n-bLJK-UKUms',
    appId: '1:1078172486002:ios:71037a1783599f5aa535eb',
    messagingSenderId: '1078172486002',
    projectId: 'newprojtest1',
    storageBucket: 'newprojtest1.appspot.com',
    iosClientId: '1078172486002-3rl0od9jqjlsood13m5glh4vua8cp7s0.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDB23q-tIuDjXghm-B59a6n-bLJK-UKUms',
    appId: '1:1078172486002:ios:71037a1783599f5aa535eb',
    messagingSenderId: '1078172486002',
    projectId: 'newprojtest1',
    storageBucket: 'newprojtest1.appspot.com',
    iosClientId: '1078172486002-3rl0od9jqjlsood13m5glh4vua8cp7s0.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}