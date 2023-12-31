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
    apiKey: 'AIzaSyDni8PLJ0psFjaUqtanLDnToEz6iJc1TnQ',
    appId: '1:595998164300:web:e044a3ba397d99ab253be9',
    messagingSenderId: '595998164300',
    projectId: 'mohit-ui-collection',
    authDomain: 'mohit-ui-collection.firebaseapp.com',
    storageBucket: 'mohit-ui-collection.appspot.com',
    measurementId: 'G-HCMBCPZLXW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2rAbvirGvwWLy3VTfuaHGs8SSl79ox3M',
    appId: '1:595998164300:android:e83bb16ff80d5a6a253be9',
    messagingSenderId: '595998164300',
    projectId: 'mohit-ui-collection',
    storageBucket: 'mohit-ui-collection.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4z8KEFLbL7qsQexM2lEdoCkdzKynRzAU',
    appId: '1:595998164300:ios:fd620815ad9a9b3e253be9',
    messagingSenderId: '595998164300',
    projectId: 'mohit-ui-collection',
    storageBucket: 'mohit-ui-collection.appspot.com',
    iosBundleId: 'com.example.mohitUiCollection',
  );
}