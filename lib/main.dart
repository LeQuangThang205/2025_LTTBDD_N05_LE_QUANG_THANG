import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/result_screen.dart';
import 'screens/history_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('vi');

  void _changeLocale(Locale locale) {
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
      routes: {
        '/home': (context) => HomeScreen(onLocaleChange: _changeLocale),
        '/result': (context) => const ResultScreen(bmi: 0, weight: 0),
        '/history': (context) => const HistoryScreen(),
        '/about': (context) => const AboutScreen(),
      },
      home: HomeScreen(onLocaleChange: _changeLocale),
    );
  }
}
