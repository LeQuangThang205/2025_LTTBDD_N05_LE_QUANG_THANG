import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = "Nguyễn Văn A";
  String _email = "user@example.com";
  String _phone = "0123456789";
  double _height = 170;
  String _gender = "male";

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final themeColor = Colors.blue.shade600;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.profileTitle ?? "Profile"),
        backgroundColor: themeColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 20),

                // 🔹 Tên
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(
                    labelText: loc.name ?? "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onSaved: (value) => _name = value ?? "",
                ),
                const SizedBox(height: 15),

                // 🔹 Email
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onSaved: (value) => _email = value ?? "",
                ),
                const SizedBox(height: 15),

                // 🔹 Số điện thoại
                TextFormField(
                  initialValue: _phone,
                  decoration: InputDecoration(
                    labelText: loc.phone ?? "Phone",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onSaved: (value) => _phone = value ?? "",
                ),
                const SizedBox(height: 15),

                // 🔹 Chiều cao
                Text("${loc.height ?? "Height"}: ${_height.round()} cm",
                    style: const TextStyle(fontSize: 16)),
                Slider(
                  value: _height,
                  min: 100,
                  max: 220,
                  activeColor: themeColor,
                  onChanged: (value) => setState(() => _height = value),
                ),
                const SizedBox(height: 10),

                // 🔹 Giới tính
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
                          color:
                              _gender == 'male' ? Colors.white : Colors.black),
                    ),
                    const SizedBox(width: 15),
                    ChoiceChip(
                      label: Text(loc.female),
                      selected: _gender == 'female',
                      onSelected: (_) => setState(() => _gender = 'female'),
                      selectedColor: themeColor,
                      labelStyle: TextStyle(
                          color: _gender == 'female'
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // 🔹 Nút lưu
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Cập nhật thông tin thành công!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    loc.save ?? "Save",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
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
