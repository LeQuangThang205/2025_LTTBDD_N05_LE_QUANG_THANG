import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final Function(Locale)? onLocaleChange;
  const AboutScreen({super.key, this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Giới thiệu ứng dụng',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          if (onLocaleChange != null)
            DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                value: Localizations.localeOf(context),
                dropdownColor: Colors.blueAccent,
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('EN', style: TextStyle(color: Colors.white)),
                  ),
                  DropdownMenuItem(
                    value: Locale('vi'),
                    child: Text('VI', style: TextStyle(color: Colors.white)),
                  ),
                ],
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) onLocaleChange!(newLocale);
                },
              ),
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.85),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ứng Dụng Tính Chỉ Số BMI',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Giữ Vóc Dáng Chuẩn với Máy Theo Dõi BMI của Chúng Tôi! '
                    'Một công cụ tính và theo dõi Chỉ Số Khối Cơ Thể (BMI) thân thiện, '
                    'phù hợp cho nam, nữ, trẻ em, thanh thiếu niên và người lớn. '
                    'Dù bạn đang trên hành trình giảm cân, tăng cơ hay duy trì sức khỏe, '
                    'ứng dụng này sẽ là người bạn đồng hành tuyệt vời!',
                    style: TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                  _sectionTitle('✨ Có Gì Bên Trong?'),
                  _sectionBody(
                      'Khám phá một công cụ mạnh mẽ được gói gọn trong giao diện tối giản nhưng đầy phong cách, '
                      'giúp bạn bắt đầu lối sống lành mạnh ngay hôm nay. '
                      'Tính BMI dễ dàng, theo dõi tiến trình và nhận được những gợi ý cá nhân hóa — tất cả miễn phí!'),
                  _sectionTitle('🌟 Tính Năng Nổi Bật'),
                  _sectionBody(
                      '• Sử Dụng Ngoại Tuyến: Không cần internet, vẫn dùng được mọi lúc, mọi nơi!\n'
                      '• Tính BMI Chính Xác: Dựa trên tuổi, giới tính, chiều cao và cân nặng.\n'
                      '• Phân Loại BMI: Xem ngay bạn thuộc nhóm nào với các phân loại chi tiết.\n'
                      '• Gợi Ý Trọng Lượng Chuẩn: Dựa theo chiều cao.\n'
                      '• Linh Hoạt Đơn Vị: Chuyển đổi giữa hệ Mỹ (lbs, ft) và Metric (kg, cm).\n'
                      '• Theo Dõi Lịch Sử: Ghi lại hành trình BMI với nhật ký chi tiết.\n'
                      '• Mẹo Sống Khỏe: Lời khuyên cá nhân hóa cho mục tiêu fitness.\n'
                      '• Chế Độ Giao Diện: Sáng / Tối linh hoạt.\n'
                      '• Hỗ Trợ Nhiều Ngôn Ngữ: Tiếng Việt và Tiếng Anh.\n'
                      '• Thiết Kế Đơn Giản: Hiện đại, dễ dùng.\n'
                      '• Hoàn Toàn Miễn Phí: Không chi phí ẩn!'),
                  _sectionTitle('📊 Các Danh Mục BMI'),
                  _sectionBody('Phạm Vi\tPhân Loại\n'
                      '< 16\tGầy Nặng\n'
                      '16 - 17\tĐộ Mỏng Trung Bình\n'
                      '17 - 18.5\tĐộ Mỏng Nhẹ\n'
                      '18.5 - 25\tBình Thường\n'
                      '25 - 30\tThừa Cân\n'
                      '30 - 35\tBéo Phì Độ I\n'
                      '35 - 40\tBéo Phì Độ II\n'
                      '> 40\tBéo Phì Độ III'),
                  _sectionTitle('🤔 Chỉ Số BMI Là Gì?'),
                  _sectionBody(
                      'Chỉ Số Khối Cơ Thể (BMI) là thước đo lượng mỡ trong cơ thể dựa trên chiều cao và cân nặng. '
                      'BMI được tính bằng công thức: cân nặng (kg) / (chiều cao * chiều cao) (m²). '
                      'Ứng dụng còn sử dụng tuổi và giới tính để tăng độ chính xác.'),
                  _sectionTitle('🚀 Hướng Dẫn Bắt Đầu'),
                  _sectionBody(
                      '1. Nhập Thông Tin: Điền giới tính, tuổi, cân nặng, chiều cao.\n'
                      '2. Tính Toán: Nhấn "Tính Toán" để xem BMI và phân loại.\n'
                      '3. Khám Phá: Xem trọng lượng lý tưởng, BMR và lời khuyên.\n'
                      '4. Theo Dõi Tiến Trình: Xem lịch sử và xu hướng BMI.'),
                  _sectionTitle('🛠️ Công Nghệ Sử Dụng'),
                  _sectionBody('• Framework: Flutter (Dart)\n'
                      '• Đa Ngôn Ngữ: intl\n'
                      '• Thư Viện UI: fl_chart, animation tùy chỉnh\n'
                      '• Lưu Trữ: shared_preferences\n'
                      '• Chia Sẻ: share_plus\n'
                      '• Tài Nguyên: Hình ảnh nền, logo splash screen'),
                  _sectionTitle('🎨 Tùy Chỉnh'),
                  _sectionBody(
                      '• Thay đổi hình nền tại assets/images/home.jpg (1080x1920px)\n'
                      '• Logo splash: assets/images/splash_logo.png (1024x1024px)\n'
                      '• Chỉnh màu sắc trong ThemeData của main.dart'),
                  _sectionTitle('🌱 Hành Trình Sức Khỏe Của Bạn'),
                  _sectionBody(
                      'Hãy bắt đầu ngay hôm nay với BMI Calculator App! '
                      'Theo dõi chỉ số BMI, nhận lời khuyên hữu ích, và chia sẻ tiến trình với bạn bè.\n\n'
                      'Nếu bạn có góp ý, hãy gửi issue hoặc pull request trên GitHub.\n\n'
                      'Được phát triển với ❤️ bởi LÊ QUANG THẮNG'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- helper widgets ---
  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      );

  Widget _sectionBody(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Text(
          text,
          style:
              const TextStyle(fontSize: 16, color: Colors.black54, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      );
}
