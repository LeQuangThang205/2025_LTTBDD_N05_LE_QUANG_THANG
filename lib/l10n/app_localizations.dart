import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  // Các khóa hiện có (đã có trước)
  String get appTitle =>
      locale.languageCode == 'vi' ? 'Tính BMI' : 'BMI Calculator';
  String get height =>
      locale.languageCode == 'vi' ? 'Chiều cao (cm)' : 'Height (cm)';
  String get weight =>
      locale.languageCode == 'vi' ? 'Cân nặng (kg)' : 'Weight (kg)';
  String get age => locale.languageCode == 'vi' ? 'Tuổi' : 'Age';
  String get calculate =>
      locale.languageCode == 'vi' ? 'Tính toán' : 'Calculate';
  String get result => locale.languageCode == 'vi' ? 'Kết quả' : 'Result';
  String get underweight =>
      locale.languageCode == 'vi' ? 'Thiếu cân' : 'Underweight';
  String get normal => locale.languageCode == 'vi' ? 'Bình thường' : 'Normal';
  String get overweight =>
      locale.languageCode == 'vi' ? 'Thừa cân' : 'Overweight';
  String get obese => locale.languageCode == 'vi' ? 'Béo phì' : 'Obese';
  String get back => locale.languageCode == 'vi' ? 'Quay lại' : 'Back';
  String get history => locale.languageCode == 'vi' ? 'Lịch sử' : 'History';
  String get trendChart =>
      locale.languageCode == 'vi' ? 'Biểu đồ xu hướng' : 'Trend Chart';
  String get advice =>
      locale.languageCode == 'vi' ? 'Gợi ý cá nhân hóa' : 'Personalized Advice';
  String get weightTrack =>
      locale.languageCode == 'vi' ? 'Theo dõi cân nặng' : 'Weight Tracking';
  String get eatHealthy => locale.languageCode == 'vi'
      ? 'Ăn uống lành mạnh, tăng calo'
      : 'Eat healthy, increase calories';
  String get maintain => locale.languageCode == 'vi'
      ? 'Duy trì lối sống cân bằng'
      : 'Maintain balanced lifestyle';
  String get exerciseMore => locale.languageCode == 'vi'
      ? 'Tập luyện nhiều hơn, giảm calo'
      : 'Exercise more, reduce calories';
  String get consultDoctor => locale.languageCode == 'vi'
      ? 'Tư vấn bác sĩ, chế độ giảm cân nghiêm ngặt'
      : 'Consult doctor, strict diet';
  String get weightChange =>
      locale.languageCode == 'vi' ? 'Thay đổi cân nặng: ' : 'Weight Change: ';
  String get gender => locale.languageCode == 'vi' ? 'Giới tính' : 'Gender';
  String get male => locale.languageCode == 'vi' ? 'Nam' : 'Male';
  String get female => locale.languageCode == 'vi' ? 'Nữ' : 'Female';
  String get noHistoryData => locale.languageCode == 'vi'
      ? 'Không có dữ liệu lịch sử'
      : 'No history data';

  // Khóa cho trang About (đã có)
  String get aboutTitle =>
      locale.languageCode == 'vi' ? 'Về Chúng Tôi' : 'About Us';
  String get aboutDescription => locale.languageCode == 'vi'
      ? 'BMI Calculator App là một dự án được phát triển với tình yêu dành cho sức khỏe cộng đồng. Chúng tôi cam kết mang đến một công cụ đơn giản, hiệu quả để giúp bạn theo dõi và cải thiện lối sống của mình.'
      : 'BMI Calculator App is a labor of love dedicated to promoting community health. We are committed to providing a simple, effective tool to help you track and enhance your lifestyle.';
  String get aboutTeam =>
      locale.languageCode == 'vi' ? 'Đội Ngũ Phát Triển' : 'Development Team';
  String get aboutTeamDetails => locale.languageCode == 'vi'
      ? 'Đội ngũ của chúng tôi bao gồm những lập trình viên đam mê và chuyên gia sức khỏe. Với sự kết hợp giữa công nghệ hiện đại và kiến thức y khoa, chúng tôi nỗ lực tạo ra một ứng dụng đáng tin cậy và thân thiện.'
      : 'Our team consists of passionate developers and health experts. Combining cutting-edge technology with medical knowledge, we strive to build a reliable and user-friendly app.';
  String get aboutContact =>
      locale.languageCode == 'vi' ? 'Liên Hệ Với Chúng Tôi' : 'Contact Us';
  String get aboutContactDetails => locale.languageCode == 'vi'
      ? 'Bạn có ý kiến hoặc câu hỏi? Hãy gửi email cho chúng tôi tại 23010236@st.phenikaa-uni.edu.vn hoặc theo dõi chúng tôi trên GitHub để cập nhật tin tức mới nhất!'
      : 'Have feedback or questions? Reach out to us at 23010236@st.phenikaa-uni.edu.vn or follow us on GitHub for the latest updates!';

  // Thêm thông tin phát triển
  String get developerInfo => locale.languageCode == 'vi'
      ? 'Thông Tin Phát Triển'
      : 'Developer Information';
  String get developerDetails => locale.languageCode == 'vi'
      ? 'Ứng dụng được phát triển bởi:\n- Tên: Lê Quang Thắng\n- Mã sinh viên: 23010236'
      : 'Developed by:\n- Name: Lê Quang Thắng\n- Student ID: 23010236';

  // Thêm nội dung từ README.md
  String get appInfoTitle => locale.languageCode == 'vi'
      ? 'Ứng Dụng Tính Chỉ Số BMI'
      : 'BMI Calculator App';
  String get appInfoDescription => locale.languageCode == 'vi'
      ? 'Giữ Vóc Dáng Chuẩn với Máy Theo Dõi BMI của Chúng Tôi! Một công cụ tính và theo dõi Chỉ Số Khối Cơ Thể (BMI) thân thiện, phù hợp cho nam, nữ, trẻ em, thanh thiếu niên và người lớn. Dù bạn đang trên hành trình giảm cân, tăng cơ hay duy trì sức khỏe, ứng dụng này sẽ là người bạn đồng hành tuyệt vời!'
      : 'Keep Your Weight in Check with Our BMI Tracker! A sleek, user-friendly BMI calculator and tracker designed for men, women, kids, teens, and adults. Whether you\'re on a journey to lose weight, gain muscle, or stay healthy, this app is your perfect companion!';

  String get featuresTitle =>
      locale.languageCode == 'vi' ? '✨ Có Gì Bên Trong?' : '✨ What’s Inside?';
  String get featuresDescription => locale.languageCode == 'vi'
      ? 'Khám phá một công cụ mạnh mẽ được gói gọn trong giao diện tối giản nhưng đầy phong cách, giúp bạn bắt đầu lối sống lành mạnh ngay hôm nay. Tính BMI dễ dàng, theo dõi tiến trình và nhận được những gợi ý cá nhân hóa—tất cả miễn phí!\n- Sử Dụng Ngoại Tuyến: Không cần internet? Vẫn dùng được mọi lúc, mọi nơi!\n- Tính BMI Chính Xác: Dựa trên tuổi, giới tính, chiều cao và cân nặng cho kết quả đáng tin cậy.\n- Phân Loại BMI: Xem ngay bạn thuộc nhóm nào với các phân loại chi tiết.\n- Gợi Ý Trọng Lượng Chuẩn: Nhận trọng lượng lý tưởng dựa trên chiều cao của bạn.\n- Linh Hoạt Đơn Vị: Chuyển đổi giữa đơn vị Mỹ (lbs, ft) và Metric (kg, cm).\n- Theo Dõi Lịch Sử: Ghi lại hành trình BMI của bạn với nhật ký chi tiết.\n- Mẹo Sống Khỏe: Lời khuyên cá nhân hóa để hỗ trợ mục tiêu fitness.\n- Chế Độ Giao Diện: Chuyển giữa sáng và tối—chọn phong cách bạn thích!\n- Hỗ Trợ Nhiều Ngôn Ngữ: Tiếng Việt và Tiếng Anh (sắp có thêm!).\n- Thiết Kế Đơn Giản: Giao diện hiện đại, dễ dùng.\n- Hoàn Toàn Miễn Phí: Không chi phí ẩn, chỉ có lợi ích sức khỏe!'
      : 'Discover a powerful tool packed in a minimalist and elegant interface to kickstart your healthy lifestyle today. Calculate your BMI effortlessly, track your progress, and get personalized insights—all for free!\n- Offline Usage: No internet? No problem! Use it anytime, anywhere.\n- Accurate BMI Calculation: Based on age, gender, height, and weight for precise results.\n- BMI Categories: Instantly see where you stand with detailed classifications.\n- Ideal Weight Suggestions: Get a target weight based on your height.\n- Unit Flexibility: Switch between US (lbs, ft) and Metric (kg, cm) units.\n- History Tracking: Monitor your BMI journey with a detailed history log.\n- Healthy Living Tips: Personalized advice to guide your fitness goals.\n- Theme Options: Toggle between light and dark modes—pick your vibe!\n- Multi-Language Support: Available in English and Vietnamese (more to come!).\n- Clean Design: Simple yet modern UI for a delightful experience.\n- 100% Free: No hidden costs, just pure health benefits!';

  String get bmiCategoriesTitle =>
      locale.languageCode == 'vi' ? '📊 Các Danh Mục BMI' : '📊 BMI Categories';
  String get bmiCategoriesDescription => locale.languageCode == 'vi'
      ? '| Phạm Vi       | Phân Loại            |\n|---------------|----------------------|\n| < 16          | Gầy Nặng             |\n| 16 - 17       | Độ Mỏng Trung Bình   |\n| 17 - 18.5     | Độ Mỏng Nhẹ          |\n| 18.5 - 25     | Bình Thường          |\n| 25 - 30       | Thừa Cân             |\n| 30 - 35       | Béo Phì Độ I         |\n| 35 - 40       | Béo Phì Độ II        |\n| > 40          | Béo Phì Độ III       |'
      : '| Range         | Classification       |\n|---------------|----------------------|\n| < 16          | Severe Thinness      |\n| 16 - 17       | Moderate Thinness    |\n| 17 - 18.5     | Mild Thinness        |\n| 18.5 - 25     | Normal Weight        |\n| 25 - 30       | Overweight           |\n| 30 - 35       | Obesity Class I      |\n| 35 - 40       | Obesity Class II     |\n| > 40          | Obesity Class III    |';

  String get gettingStartedTitle => locale.languageCode == 'vi'
      ? '🚀 Hướng Dẫn Bắt Đầu'
      : '🚀 Getting Started';
  String get gettingStartedDescription => locale.languageCode == 'vi'
      ? 'Cách Sử Dụng\n- Nhập Thông Tin: Điền giới tính, tuổi, cân nặng và chiều cao bằng các thanh trượt hoặc số liệu.\n- Tính Toán: Nhấn nút "Tính Toán" để xem BMI và phân loại của bạn.\n- Khám Phá: Kiểm tra trọng lượng lý tưởng, BMR (Tỷ Lệ Chuyển Hóa Cơ Bản), và lời khuyên cá nhân.\n- Theo Dõi Tiến Trình: Xem lịch sử và xu hướng để giữ động lực!\n\nĐiều Kiện Tiền Quyết\n- Flutter SDK: Đảm bảo đã cài Flutter (phiên bản 3.0.0 trở lên).\n- IDE: Sử dụng Android Studio, VS Code hoặc bất kỳ trình soạn thảo nào hỗ trợ Flutter.\n- Phụ Thuộc: Cài đặt các package cần thiết qua pubspec.yaml.\n\nCài Đặt\n- Clone repository:\n  ```text\ngit clone https://github.com/username/bmi_calculator_app.git\n```\n- Vào thư mục dự án:\n  ```text\ncd bmi_calculator_app\n```\n- Cài đặt phụ thuộc:\n  ```text\nflutter pub get\n```\n- Chạy ứng dụng:\n  ```text\nflutter run\n```'
      : 'How to Use\n- Input Your Details: Enter your gender, age, weight, and height using the intuitive sliders or numeric inputs.\n- Calculate: Hit the "Calculate" button to see your BMI and classification.\n- Explore: Check your ideal weight, BMR (Basal Metabolic Rate), and personalized advice.\n- Track Progress: View your history and trends to stay motivated!\n\nPrerequisites\n- Flutter SDK: Ensure Flutter is installed (v3.0.0 or higher).\n- IDE: Use Android Studio, VS Code, or any Flutter-compatible editor.\n- Dependencies: Install required packages via pubspec.yaml.\n\nInstallation\n- Clone repository:\n  ```text\ngit clone https://github.com/username/bmi_calculator_app.git\n```\n- Navigate to the project folder:\n  ```text\ncd bmi_calculator_app\n```\n- Install dependencies:\n  ```text\nflutter pub get\n```\n- Run the app:\n  ```text\nflutter run\n```';

  String get techStackTitle =>
      locale.languageCode == 'vi' ? '🛠️ Công Nghệ Sử Dụng' : '🛠️ Tech Stack';
  String get techStackDescription => locale.languageCode == 'vi'
      ? 'Framework: Flutter (Dart)\nĐa Ngôn Ngữ: intl cho hỗ trợ nhiều ngôn ngữ\nThư Viện UI: fl_chart cho biểu đồ, animation tùy chỉnh\nLưu Trữ: shared_preferences để theo dõi lịch sử\nChia Sẻ: share_plus để chia sẻ kết quả\nTài Nguyên: Hình ảnh tùy chỉnh (ví dụ: home.jpg) cho nền đẹp mắt'
      : 'Framework: Flutter (Dart)\nLocalization: intl for multi-language support\nUI Libraries: fl_chart for charts, custom animations\nStorage: shared_preferences for history tracking\nSharing: share_plus for result sharing\nAssets: Custom images (e.g., home.jpg) for a stunning background';

  String get customizationTitle =>
      locale.languageCode == 'vi' ? '🎨 Tùy Chỉnh' : '🎨 Customization';
  String get customizationDescription => locale.languageCode == 'vi'
      ? 'Thêm Cá Tính: Thay assets/images/home.jpg bằng hình ảnh chủ đề fitness của bạn (kích thước đề xuất: 1080x1920px).\nLogo: Thêm logo splash screen trong assets/images/splash_logo.png (1024x1024px).\nChủ Đề: Chỉnh sửa ThemeData trong main.dart để phù hợp sở thích.'
      : 'Add Your Touch: Replace assets/images/home.jpg with your own fitness-themed image (recommended size: 1080x1920px).\nLogo: Add a splash screen logo in assets/images/splash_logo.png (1024x1024px).\nThemes: Modify ThemeData in main.dart to match your preference.';

  String get healthJourneyTitle => locale.languageCode == 'vi'
      ? '🌱 Hành Trình Sức Khỏe Của Bạn'
      : '🌱 Your Health Journey';
  String get healthJourneyDescription => locale.languageCode == 'vi'
      ? 'Hãy bắt đầu ngay hôm nay với BMI Calculator App! Theo dõi chỉ số BMI, nhận lời khuyên hữu ích, và chia sẻ tiến trình với bạn bè. Nếu bạn có ý tưởng hay góp ý, đừng ngần ngại mở issue trên GitHub hoặc gửi pull request!\nCập nhật lần cuối: 24/09/2025 - 06:15 PM (+07)\nĐược phát triển với ❤️ bởi Lê Quang Thắng'
      : 'Start your journey today with BMI Calculator App! Track your BMI, get helpful advice, and share your progress with friends. If you have ideas or feedback, feel free to open an issue on GitHub or send a pull request!\nLast updated: 09/24/2025 - 06:15 PM (+07)\nDeveloped with ❤️ by Lê Quang Thắng';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_) => false;
}
