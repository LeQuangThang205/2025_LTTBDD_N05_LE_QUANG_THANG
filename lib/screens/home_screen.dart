import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'result_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;

  const HomeScreen({super.key, this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 150;
  double _weight = 60;
  int _age = 25;
  String _gender = 'male';
  String currentLanguage = 'vi';

  void _toggleLanguage() {
    setState(() {
      if (currentLanguage == 'vi') {
        currentLanguage = 'en';
        widget.onLocaleChange?.call(const Locale('en'));
      } else {
        currentLanguage = 'vi';
        widget.onLocaleChange?.call(const Locale('vi'));
      }
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, color: Colors.white, size: 60),
                  const SizedBox(height: 10),
                  Text(
                    loc.appTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(loc.home),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text(loc.history),
              onTap: () => Navigator.pushNamed(context, '/history'),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(loc.about),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            const Divider(),

            // 🔹 Đổi ngôn ngữ
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(currentLanguage == 'vi' ? 'English' : 'Tiếng Việt'),
              onTap: _toggleLanguage,
            ),

            // 🔹 Đăng xuất
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(loc.logout),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              loc.calculateBmi,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),

            // Height
            Text("${loc.height}: ${_height.round()} cm"),
            Slider(
              value: _height,
              min: 100,
              max: 220,
              divisions: 120,
              label: "${_height.round()} cm",
              onChanged: (value) => setState(() => _height = value),
            ),
            const SizedBox(height: 20),

            // Weight
            Text("${loc.weight}: ${_weight.round()} kg"),
            Slider(
              value: _weight,
              min: 30,
              max: 150,
              divisions: 120,
              label: "${_weight.round()} kg",
              onChanged: (value) => setState(() => _weight = value),
            ),
            const SizedBox(height: 20),

            // Age
            Text("${loc.age}: $_age"),
            Slider(
              value: _age.toDouble(),
              min: 10,
              max: 80,
              divisions: 70,
              label: "$_age",
              onChanged: (value) => setState(() => _age = value.round()),
            ),
            const SizedBox(height: 20),

            // Gender
            Text(
              loc.gender,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text(loc.male),
                  selected: _gender == 'male',
                  onSelected: (_) => setState(() => _gender = 'male'),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: Text(loc.female),
                  selected: _gender == 'female',
                  onSelected: (_) => setState(() => _gender = 'female'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Calculate Button
            ElevatedButton(
              onPressed: () {
                double bmi = _weight / ((_height / 100) * (_height / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(bmi: bmi, weight: _weight),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(loc.calculateNow),
            ),
          ],
        ),
      ),
    );
  }
}
