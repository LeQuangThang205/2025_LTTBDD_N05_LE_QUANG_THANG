// File: lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError(
          'Unsupported platform: $defaultTargetPlatform',
        );
    }
  }

  // 🌐 Web Config (bạn đã tạo từ Firebase Console)
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDQZBDJMbWAkMBqhy2CBu83K9kDocE1KK4",
    authDomain: "app-bmi-a67ab.firebaseapp.com",
    projectId: "app-bmi-a67ab",
    storageBucket: "app-bmi-a67ab.firebasestorage.app",
    messagingSenderId: "402704962965",
    appId: "1:402704962965:web:ddcca632a226be7797d29c",
    measurementId: "G-4SC1XQBJ85",
  );

  // 📱 Android Config (từ file google-services.json bạn gửi)
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBihP48HXDooHB6wgemCtkMoUry9IQQ9II",
    appId: "1:402704962965:android:308966cfc120415997d29c",
    messagingSenderId: "402704962965",
    projectId: "app-bmi-a67ab",
    storageBucket: "app-bmi-a67ab.firebasestorage.app",
  );
}
