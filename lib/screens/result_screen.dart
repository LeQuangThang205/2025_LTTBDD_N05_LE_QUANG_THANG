import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final double weight; // Thêm để theo dõi cân nặng

  const ResultScreen({super.key, required this.bmi, required this.weight});

  Future<void> _saveToHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('bmi_history') ?? [];
    String entry = '${DateTime.now().toIso8601String()}: BMI $bmi, Weight $weight kg';
    history.add(entry);
    prefs.setStringList('bmi_history', history);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    Color color;
    String category;
    String advice;
    if (bmi < 18.5) {
      color = Colors.yellow;
      category = loc.underweight;
      advice = loc.eatHealthy;
    } else if (bmi < 25) {
      color = Colors.green;
      category = loc.normal;
      advice = loc.maintain;
    } else if (bmi < 30) {
      color = Colors.orange;
      category = loc.overweight;
      advice = loc.exerciseMore;
    } else {
      color = Colors.red;
      category = loc.obese;
      advice = loc.consultDoctor;
    }

    _saveToHistory(); // Lưu vào lịch sử

    return Scaffold(
      appBar: AppBar(title: Text(loc.result)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI: ${bmi.toStringAsFixed(1)}', style: TextStyle(fontSize: 24, color: color)),
            const SizedBox(height: 20),
            Text(category, style: TextStyle(fontSize: 20, color: color)),
            const SizedBox(height: 20),
            Text(loc.advice, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(advice, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(loc.weightChange + '$weight kg', style: const TextStyle(fontSize: 16)), // Theo dõi cân nặng
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.back),
            ),
          ],
        ),
      ),
    );
  }
}