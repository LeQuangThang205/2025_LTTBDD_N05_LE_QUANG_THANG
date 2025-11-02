import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Dữ liệu người dùng
  String _fullName = "Nguyễn Văn A";
  String _email = "user@example.com";
  String _phone = "0123456789";
  DateTime _birthday = DateTime(2000, 1, 1);
  double _height = 170;
  String _gender = "male";

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  // 🧩 Hàm tải dữ liệu từ Firestore
  Future<void> _loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        setState(() {
          _fullName = data['name'] ?? "Nguyễn Văn A";
          _email = data['email'] ?? "user@example.com";
          _phone = data['phone'] ?? "0123456789";
          _height = (data['height'] ?? 170).toDouble();
          _gender = data['gender'] ?? "male";
          if (data['birthday'] != null) {
            try {
              _birthday = DateTime.parse(data['birthday']);
            } catch (_) {
              // Nếu ngày sinh không đúng định dạng ISO thì bỏ qua
            }
          }
        });
      }
    } catch (e) {
      debugPrint("❌ Lỗi khi tải hồ sơ: $e");
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final themeColor = Colors.blue.shade600;

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.profileTitle ?? "Hồ sơ"),
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

                // 🔹 Họ tên
                TextFormField(
                  initialValue: _fullName,
                  decoration: InputDecoration(
                    labelText: loc.name ?? "Họ và tên",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  onSaved: (value) => _fullName = value ?? "",
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
                    prefixIcon: const Icon(Icons.email),
                  ),
                  onSaved: (value) => _email = value ?? "",
                ),
                const SizedBox(height: 15),

                // 🔹 Số điện thoại
                TextFormField(
                  initialValue: _phone,
                  decoration: InputDecoration(
                    labelText: loc.phone ?? "Số điện thoại",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  onSaved: (value) => _phone = value ?? "",
                ),
                const SizedBox(height: 15),

                // 🔹 Ngày sinh
                InkWell(
                  onTap: _pickBirthday,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "Ngày sinh",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.cake),
                    ),
                    child: Text(
                      "${_birthday.day}/${_birthday.month}/${_birthday.year}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Chiều cao
                Text("${loc.height ?? "Chiều cao"}: ${_height.round()} cm",
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
                  loc.gender ?? "Giới tính",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: Text(loc.male ?? "Nam"),
                      selected: _gender == 'male',
                      onSelected: (_) => setState(() => _gender = 'male'),
                      selectedColor: themeColor,
                      labelStyle: TextStyle(
                        color: _gender == 'male' ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 15),
                    ChoiceChip(
                      label: Text(loc.female ?? "Nữ"),
                      selected: _gender == 'female',
                      onSelected: (_) => setState(() => _gender = 'female'),
                      selectedColor: themeColor,
                      labelStyle: TextStyle(
                        color:
                            _gender == 'female' ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // 🔹 Nút lưu
                ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.save),
                  label: Text(loc.save ?? "Lưu thông tin"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🗓 Chọn ngày sinh
  Future<void> _pickBirthday() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthday,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      locale: const Locale('vi'),
    );
    if (picked != null) {
      setState(() => _birthday = picked);
    }
  }

  // 💾 Lưu thông tin vào Firestore
  Future<void> _saveProfile() async {
    _formKey.currentState?.save();

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng đăng nhập trước khi lưu.")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': _fullName,
        'email': _email,
        'phone': _phone,
        'birthday': _birthday.toIso8601String(),
        'height': _height,
        'gender': _gender,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Cập nhật thông tin thành công!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Lỗi khi lưu: $e")),
      );
    }
  }
}
