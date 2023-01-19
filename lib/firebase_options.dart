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
    apiKey: 'AIzaSyB55OiE8Ymk6_9fH_VHaSGimWL50l29EVw',
    appId: '1:452041305778:web:2d479479ab533b6f60a3ab',
    messagingSenderId: '452041305778',
    projectId: 'report-system-8d623',
    authDomain: 'report-system-8d623.firebaseapp.com',
    storageBucket: 'report-system-8d623.appspot.com',
    measurementId: 'G-98K3NHNFFB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwkaGkk8fYZRU0EST_7f-GuuCkAf-OJrM',
    appId: '1:452041305778:android:73b97af5403a401d60a3ab',
    messagingSenderId: '452041305778',
    projectId: 'report-system-8d623',
    storageBucket: 'report-system-8d623.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0qzvfCF2GhMkj7OVLfnlfy4Xs0-U6xOU',
    appId: '1:452041305778:ios:2eed27a024ade67360a3ab',
    messagingSenderId: '452041305778',
    projectId: 'report-system-8d623',
    storageBucket: 'report-system-8d623.appspot.com',
    androidClientId: '452041305778-3hecf30i8i3tjd6u3iti0337570nost4.apps.googleusercontent.com',
    iosClientId: '452041305778-gshhv4qeotcl2ov9btmn7ji2g5trjg24.apps.googleusercontent.com',
    iosBundleId: 'com.example.reportSystemAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0qzvfCF2GhMkj7OVLfnlfy4Xs0-U6xOU',
    appId: '1:452041305778:ios:2eed27a024ade67360a3ab',
    messagingSenderId: '452041305778',
    projectId: 'report-system-8d623',
    storageBucket: 'report-system-8d623.appspot.com',
    androidClientId: '452041305778-3hecf30i8i3tjd6u3iti0337570nost4.apps.googleusercontent.com',
    iosClientId: '452041305778-gshhv4qeotcl2ov9btmn7ji2g5trjg24.apps.googleusercontent.com',
    iosBundleId: 'com.example.reportSystemAdmin',
  );
}
