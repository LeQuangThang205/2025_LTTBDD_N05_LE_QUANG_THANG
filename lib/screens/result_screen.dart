import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final double weight;

  const ResultScreen({
    super.key,
    required this.bmi,
    required this.weight,
  });

  /// Lưu kết quả BMI vào SharedPreferences
  Future<void> _saveToHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('bmi_history') ?? [];
    String formattedDate =
        "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
    String entry =
        "$formattedDate: BMI ${bmi.toStringAsFixed(1)}, Weight ${weight.toStringAsFixed(1)} kg";
    history.add(entry);
    await prefs.setStringList('bmi_history', history);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    // Phân loại BMI
    Color color;
    String category;
    String advice;

    if (bmi < 18.5) {
      color = Colors.yellow.shade700;
      category = loc.underweight;
      advice = loc.eatHealthy;
    } else if (bmi < 25) {
      color = Colors.green.shade700;
      category = loc.normal;
      advice = loc.maintain;
    } else if (bmi < 30) {
      color = Colors.orange.shade700;
      category = loc.overweight;
      advice = loc.exerciseMore;
    } else {
      color = Colors.red.shade700;
      category = loc.obese;
      advice = loc.consultDoctor;
    }

    // Gọi hàm lưu lịch sử
    _saveToHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.result,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    loc.bmiResultTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${loc.bmiValue}: ${bmi.toStringAsFixed(1)}",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${loc.category}: $category",
                    style: TextStyle(fontSize: 18, color: color),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    loc.advice,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    advice,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${loc.weightChange}: ${weight.toStringAsFixed(1)} kg",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: Text(loc.back),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
