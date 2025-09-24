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

  // Thêm các getter mới
  String get gender => locale.languageCode == 'vi' ? 'Giới tính' : 'Gender';
  String get male => locale.languageCode == 'vi' ? 'Nam' : 'Male';
  String get female => locale.languageCode == 'vi' ? 'Nữ' : 'Female';
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
