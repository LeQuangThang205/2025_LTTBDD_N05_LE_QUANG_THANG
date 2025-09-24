import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const SplashScreen({super.key, required this.onLocaleChange});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Chuyển sang HomeScreen sau 2 giây
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              HomeScreen(onLocaleChange: widget.onLocaleChange),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/home.jpg'), // Sử dụng home.jpg làm nền splash
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Thêm logo hoặc text (tùy chọn)
              const Icon(Icons.fitness_center, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).appTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
