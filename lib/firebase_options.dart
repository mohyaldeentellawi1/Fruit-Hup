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
    apiKey: 'AIzaSyA9sfLcTYDorQmJXcA87m1BW8A4iLj6hkQ',
    appId: '1:428435947643:web:505b5c68c651cf7dc2e2de',
    messagingSenderId: '428435947643',
    projectId: 'fruite-hub-b37af',
    authDomain: 'fruite-hub-b37af.firebaseapp.com',
    storageBucket: 'fruite-hub-b37af.firebasestorage.app',
    measurementId: 'G-HDG4N6062M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyn7jbwSHqA6M5znhsAwG0C1OQnTCNANk',
    appId: '1:428435947643:android:62ed1073be80f836c2e2de',
    messagingSenderId: '428435947643',
    projectId: 'fruite-hub-b37af',
    storageBucket: 'fruite-hub-b37af.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDstCntKHWmJS1VA4Oa8Z7gW9eB5RQehXU',
    appId: '1:428435947643:ios:618ef71e172afe5fc2e2de',
    messagingSenderId: '428435947643',
    projectId: 'fruite-hub-b37af',
    storageBucket: 'fruite-hub-b37af.firebasestorage.app',
    iosBundleId: 'com.example.fruitHup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDstCntKHWmJS1VA4Oa8Z7gW9eB5RQehXU',
    appId: '1:428435947643:ios:618ef71e172afe5fc2e2de',
    messagingSenderId: '428435947643',
    projectId: 'fruite-hub-b37af',
    storageBucket: 'fruite-hub-b37af.firebasestorage.app',
    iosBundleId: 'com.example.fruitHup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9sfLcTYDorQmJXcA87m1BW8A4iLj6hkQ',
    appId: '1:428435947643:web:e26174b167e06c27c2e2de',
    messagingSenderId: '428435947643',
    projectId: 'fruite-hub-b37af',
    authDomain: 'fruite-hub-b37af.firebaseapp.com',
    storageBucket: 'fruite-hub-b37af.firebasestorage.app',
    measurementId: 'G-5E88546QCG',
  );
}
