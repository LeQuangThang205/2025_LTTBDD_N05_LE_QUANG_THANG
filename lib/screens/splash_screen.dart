import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale)? onLocaleChange;

  const SplashScreen({super.key, this.onLocaleChange});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeFirebaseAndCheckUser();
  }

  /// 🔹 Khởi tạo Firebase và kiểm tra trạng thái đăng nhập
  Future<void> _initializeFirebaseAndCheckUser() async {
    try {
      // Đảm bảo Firebase đã được khởi tạo
      await Firebase.initializeApp();

      // Tạm dừng 2 giây để hiển thị logo (hiệu ứng splash)
      await Future.delayed(const Duration(seconds: 2));

      // Lấy thông tin user hiện tại
      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      // Nếu đã đăng nhập
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              onLocaleChange: widget.onLocaleChange,
            ),
          ),
        );
      } else {
        // Nếu chưa đăng nhập
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      // Nếu có lỗi Firebase, hiển thị thông báo nhẹ và cho phép thử lại
      debugPrint("🔥 Lỗi Firebase khởi tạo: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể kết nối Firebase. Vui lòng thử lại.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      _initializeFirebaseAndCheckUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.fitness_center, size: 150, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 10),
              Text(
                'Đang khởi tạo...',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
