import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'screens/history_screen.dart';
import 'screens/about_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDQZBDJMbWAkMBqhy2CBu83K9kDocE1KK4",
      authDomain: "app-bmi-a67ab.firebaseapp.com",
      projectId: "app-bmi-a67ab",
      storageBucket: "app-bmi-a67ab.firebasestorage.app",
      messagingSenderId: "402704962965",
      appId: "1:402704962965:web:ddcca632a226be7797d29c",
      measurementId: "G-4SC1XQBJ85",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('vi');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/history': (context) => const HistoryScreen(),
        '/about': (context) => const AboutScreen(),
        '/result': (context) => const ResultScreen(bmi: 0, weight: 0),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) => const LoginScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
