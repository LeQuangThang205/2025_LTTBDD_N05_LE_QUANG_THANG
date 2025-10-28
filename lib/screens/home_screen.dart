import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'result_screen.dart';
import 'login_screen.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;

  const HomeScreen({super.key, this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 170;
  double _weight = 60;
  int _age = 25;
  String _gender = 'male';
  String currentLanguage = 'vi';

  void _toggleLanguage() {
    setState(() {
      if (currentLanguage == 'vi') {
        currentLanguage = 'en';
        MyApp.of(context)?.setLocale(const Locale('en'));
      } else {
        currentLanguage = 'vi';
        MyApp.of(context)?.setLocale(const Locale('vi'));
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
    final themeColor = Colors.blue.shade600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.appTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeColor,
        centerTitle: true,
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            // 🔹 Header có gradient và avatar tròn
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40),
              width: double.infinity,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "BMI Calculator App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: Text("Home"),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text("Profile"),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.blue),
              title: Text(loc.history),
              onTap: () => Navigator.pushNamed(context, '/history'),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: Text(loc.about),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.blue),
              title:
                  Text(currentLanguage == 'vi' ? loc.english : loc.vietnamese),
              onTap: _toggleLanguage,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(loc.logout),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                loc.calculateBmi,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              const SizedBox(height: 25),

              // 🔹 Card nhập thông tin BMI
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Chiều cao
                      Text("${loc.height}: ${_height.round()} cm",
                          style: const TextStyle(fontSize: 16)),
                      Slider(
                        value: _height,
                        min: 100,
                        max: 220,
                        activeColor: themeColor,
                        label: "${_height.round()} cm",
                        onChanged: (value) => setState(() => _height = value),
                      ),
                      const SizedBox(height: 15),

                      // Cân nặng
                      Text("${loc.weight}: ${_weight.round()} kg",
                          style: const TextStyle(fontSize: 16)),
                      Slider(
                        value: _weight,
                        min: 30,
                        max: 150,
                        activeColor: themeColor,
                        label: "${_weight.round()} kg",
                        onChanged: (value) => setState(() => _weight = value),
                      ),
                      const SizedBox(height: 15),

                      // Tuổi
                      Text("${loc.age}: $_age",
                          style: const TextStyle(fontSize: 16)),
                      Slider(
                        value: _age.toDouble(),
                        min: 10,
                        max: 80,
                        activeColor: themeColor,
                        label: "$_age",
                        onChanged: (value) =>
                            setState(() => _age = value.round()),
                      ),
                      const SizedBox(height: 15),

                      // Giới tính
                      Text(
                        loc.gender,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChoiceChip(
                            label: Text(loc.male),
                            selected: _gender == 'male',
                            onSelected: (_) => setState(() => _gender = 'male'),
                            selectedColor: themeColor,
                            labelStyle: TextStyle(
                                color: _gender == 'male'
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const SizedBox(width: 15),
                          ChoiceChip(
                            label: Text(loc.female),
                            selected: _gender == 'female',
                            onSelected: (_) =>
                                setState(() => _gender = 'female'),
                            selectedColor: themeColor,
                            labelStyle: TextStyle(
                                color: _gender == 'female'
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // 🔹 Nút tính BMI
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
                  backgroundColor: themeColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  loc.calculateNow,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
