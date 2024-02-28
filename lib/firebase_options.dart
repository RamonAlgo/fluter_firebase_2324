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
    apiKey: 'AIzaSyDrAex2JtKixYiZRS_r-gW5lXzb-VkVZ8w',
    appId: '1:144020953047:web:1f2650175af15570c8dd92',
    messagingSenderId: '144020953047',
    projectId: 'flutterfirebae2324',
    authDomain: 'flutterfirebae2324.firebaseapp.com',
    storageBucket: 'flutterfirebae2324.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuSq18Re63AZx7KUl2BNamVTm90e8ejfM',
    appId: '1:144020953047:android:8e916cc39bd82b9dc8dd92',
    messagingSenderId: '144020953047',
    projectId: 'flutterfirebae2324',
    storageBucket: 'flutterfirebae2324.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjiiYnEBsvm25ZxyFH64uMKW7fT950qlU',
    appId: '1:144020953047:ios:d332e601e620bf6bc8dd92',
    messagingSenderId: '144020953047',
    projectId: 'flutterfirebae2324',
    storageBucket: 'flutterfirebae2324.appspot.com',
    iosBundleId: 'com.example.fluterFirebase2324',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjiiYnEBsvm25ZxyFH64uMKW7fT950qlU',
    appId: '1:144020953047:ios:22156316f6df50a1c8dd92',
    messagingSenderId: '144020953047',
    projectId: 'flutterfirebae2324',
    storageBucket: 'flutterfirebae2324.appspot.com',
    iosBundleId: 'com.example.fluterFirebase2324.RunnerTests',
  );
}