import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 150;
  double _weight = 60;
  int _age = 25;
  String _gender = 'Male';
  late Locale _locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locale = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
        actions: [
          DropdownButton<Locale>(
            value: _locale,
            items: const [
              DropdownMenuItem(
                value: Locale('en'),
                child: Text('EN'),
              ),
              DropdownMenuItem(
                value: Locale('vi'),
                child: Text('VI'),
              ),
            ],
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                widget.onLocaleChange(newLocale);
                setState(() {
                  _locale = newLocale;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Thêm để responsive
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4, // Bo góc và bóng
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(loc.height, style: const TextStyle(fontSize: 18)),
                    Slider(
                      value: _height,
                      min: 100,
                      max: 220,
                      onChanged: (value) => setState(() => _height = value),
                    ),
                    Text('${_height.round()} cm'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(loc.weight, style: const TextStyle(fontSize: 18)),
                    Slider(
                      value: _weight,
                      min: 30,
                      max: 150,
                      onChanged: (value) => setState(() => _weight = value),
                    ),
                    Text('${_weight.round()} kg'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(loc.age, style: const TextStyle(fontSize: 18)),
                    Slider(
                      value: _age.toDouble(),
                      min: 10,
                      max: 100,
                      onChanged: (value) => setState(() => _age = value.round()),
                    ),
                    Text('$_age'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Male'),
                Radio<String>(
                  value: 'Male',
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
                Text('Female'),
                Radio<String>(
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (value) => setState(() => _gender = value!),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.calculate),
              label: Text(loc.calculate),
              onPressed: () {
                final bmi = _weight / ((_height / 100) * (_height / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(bmi: bmi),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}