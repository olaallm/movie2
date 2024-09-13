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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbWUXD_l7n5GPdgag7wByfF9Jz4cShY0E',
    appId: '1:737100653555:web:873c1df8935262cc7a6886',
    messagingSenderId: '737100653555',
    projectId: 'movies-ff5bf',
    authDomain: 'movies-ff5bf.firebaseapp.com',
    storageBucket: 'movies-ff5bf.appspot.com',
    measurementId: 'G-9XVGFJFFNH',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXcx8o6Bj2ARAS6W1o2xyT9A8Jl_ak0OY',
    appId: '1:737100653555:android:ccb3bbe99f1be0b17a6886',
    messagingSenderId: '737100653555',
    projectId: 'movies-ff5bf',
    storageBucket: 'movies-ff5bf.appspot.com',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWftMxf8lEVKBNbURVf8L1o7xnkWfWZ4Y',
    appId: '1:737100653555:ios:d4854b01eccce3217a6886',
    messagingSenderId: '737100653555',
    projectId: 'movies-ff5bf',
    storageBucket: 'movies-ff5bf.appspot.com',
    iosBundleId: 'com.example.movie',
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWftMxf8lEVKBNbURVf8L1o7xnkWfWZ4Y',
    appId: '1:737100653555:ios:d4854b01eccce3217a6886',
    messagingSenderId: '737100653555',
    projectId: 'movies-ff5bf',
    storageBucket: 'movies-ff5bf.appspot.com',
    iosBundleId: 'com.example.movie',
  );

  static FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbWUXD_l7n5GPdgag7wByfF9Jz4cShY0E',
    appId: '1:737100653555:web:a2a368c5863404ef7a6886',
    messagingSenderId: '737100653555',
    projectId: 'movies-ff5bf',
    authDomain: 'movies-ff5bf.firebaseapp.com',
    storageBucket: 'movies-ff5bf.appspot.com',
    measurementId: 'G-X6RC2F5S32',
  );
}
