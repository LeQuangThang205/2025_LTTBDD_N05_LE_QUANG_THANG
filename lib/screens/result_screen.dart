import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  const ResultScreen({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    Color color;
    String category;
    if (bmi < 18.5) {
      color = Colors.yellow;
      category = loc.underweight;
    } else if (bmi < 25) {
      color = Colors.green;
      category = loc.normal;
    } else if (bmi < 30) {
      color = Colors.orange;
      category = loc.overweight;
    } else {
      color = Colors.red;
      category = loc.obese;
    }
    return Scaffold(
      appBar: AppBar(title: Text(loc.result)),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500), // Animation
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('BMI: ${bmi.toStringAsFixed(1)}', style: TextStyle(fontSize: 24, color: color)),
                  const SizedBox(height: 20),
                  Text(category, style: TextStyle(fontSize: 20, color: color)),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: Text(loc.back),
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}