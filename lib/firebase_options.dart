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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2_5bUw43LxEi4-vXgd52s8FnbO_wsB0g',
    appId: '1:212500446904:android:c4a47e8259c5d43acbbe4d',
    messagingSenderId: '212500446904',
    projectId: 'cargo-laravel',
    databaseURL: 'https://cargo-laravel-default-rtdb.firebaseio.com',
    storageBucket: 'cargo-laravel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJLxRlWAZG4JP_8L8rr9EIxywmDrL-Wg4',
    appId: '1:212500446904:ios:fbfe31b77168b931cbbe4d',
    messagingSenderId: '212500446904',
    projectId: 'cargo-laravel',
    databaseURL: 'https://cargo-laravel-default-rtdb.firebaseio.com',
    storageBucket: 'cargo-laravel.appspot.com',
    iosClientId: '212500446904-km1toplpiq12163bp62v7n22vs7gm0a7.apps.googleusercontent.com',
    iosBundleId: 'com.example.kargoApp',
  );
}
