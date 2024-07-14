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
    apiKey: 'AIzaSyBo7L7r5WabyJTOYnbrGf5rITUD6JogDCg',
    appId: '1:999885217411:web:7d6d92d7b6920c0c4e85b6',
    messagingSenderId: '999885217411',
    projectId: 'fir-project-b4dca',
    authDomain: 'fir-project-b4dca.firebaseapp.com',
    storageBucket: 'fir-project-b4dca.appspot.com',
    measurementId: 'G-ZXHWBYQ0NW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBIZQehuJosZcKmJ0_5DHstHeVRlgn81g',
    appId: '1:999885217411:android:07134ea0aad762774e85b6',
    messagingSenderId: '999885217411',
    projectId: 'fir-project-b4dca',
    storageBucket: 'fir-project-b4dca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlRZZtFiyCWZzQgL0XRCVY8a4mTmfJQKU',
    appId: '1:999885217411:ios:2361c76abe43355b4e85b6',
    messagingSenderId: '999885217411',
    projectId: 'fir-project-b4dca',
    storageBucket: 'fir-project-b4dca.appspot.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlRZZtFiyCWZzQgL0XRCVY8a4mTmfJQKU',
    appId: '1:999885217411:ios:2361c76abe43355b4e85b6',
    messagingSenderId: '999885217411',
    projectId: 'fir-project-b4dca',
    storageBucket: 'fir-project-b4dca.appspot.com',
    iosBundleId: 'com.example.firebaseProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBo7L7r5WabyJTOYnbrGf5rITUD6JogDCg',
    appId: '1:999885217411:web:808a387781a17bd74e85b6',
    messagingSenderId: '999885217411',
    projectId: 'fir-project-b4dca',
    authDomain: 'fir-project-b4dca.firebaseapp.com',
    storageBucket: 'fir-project-b4dca.appspot.com',
    measurementId: 'G-EDT5ZBV0KX',
  );
}