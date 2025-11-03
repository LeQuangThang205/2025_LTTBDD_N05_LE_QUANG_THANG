import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../l10n/app_localizations.dart';
import 'result_screen.dart';
import 'login_screen.dart';
import '../main.dart';
import 'blog_screen.dart'; // ✅ thêm dòng này

class HomeScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;

  const HomeScreen({super.key, this.onLocaleChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _gender = 'male';
  String _heightUnit = 'cm';
  String _weightUnit = 'kg';
  String currentLanguage = 'vi';

  final _formKey = GlobalKey<FormState>();

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

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if (_heightUnit == 'cm') height /= 100;
      if (_weightUnit == 'lb') weight *= 0.453592;

      double bmi = weight / (height * height);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(bmi: bmi, weight: weight),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final themeColor = Colors.blue.shade600;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.appTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeColor,
        centerTitle: true,
      ),

      // ---------------- DRAWER ----------------
      drawer: Drawer(
        child: Column(
          children: [
            StreamBuilder<DocumentSnapshot>(
              stream: user != null
                  ? FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .snapshots()
                  : null,
              builder: (context, snapshot) {
                String name = "BMI Calculator App";
                if (snapshot.hasData && snapshot.data!.exists) {
                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  if (data.containsKey('name') &&
                      data['name'].toString().trim().isNotEmpty) {
                    name = data['name'];
                  }
                }

                return Container(
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
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text("Home"),
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

            // ✅ Thêm mục Blog
            ListTile(
              leading: const Icon(Icons.article, color: Colors.blue),
              title: const Text("Blog"),
              onTap: () => Navigator.pushNamed(context, '/blog'),
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

      // ---------------- BODY ----------------
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  loc.calculateBmi,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),
                ),
                const SizedBox(height: 25),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: '${loc.height} ($_heightUnit)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: DropdownButton<String>(
                              value: _heightUnit,
                              underline: const SizedBox(),
                              onChanged: (val) =>
                                  setState(() => _heightUnit = val!),
                              items: const [
                                DropdownMenuItem(
                                    value: 'cm', child: Text('cm')),
                                DropdownMenuItem(value: 'm', child: Text('m')),
                              ],
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập chiều cao';
                            }
                            final h = double.tryParse(value);
                            if (h == null || h <= 0) {
                              return 'Chiều cao không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: '${loc.weight} ($_weightUnit)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: DropdownButton<String>(
                              value: _weightUnit,
                              underline: const SizedBox(),
                              onChanged: (val) =>
                                  setState(() => _weightUnit = val!),
                              items: const [
                                DropdownMenuItem(
                                    value: 'kg', child: Text('kg')),
                                DropdownMenuItem(
                                    value: 'lb', child: Text('lb')),
                              ],
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập cân nặng';
                            }
                            final w = double.tryParse(value);
                            if (w == null || w <= 0) {
                              return 'Cân nặng không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: loc.age,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tuổi';
                            }
                            final a = int.tryParse(value);
                            if (a == null || a <= 0) {
                              return 'Tuổi không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text(loc.male),
                                selected: _gender == 'male',
                                onSelected: (_) =>
                                    setState(() => _gender = 'male'),
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
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 50),
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
      ),
    );
  }
}
