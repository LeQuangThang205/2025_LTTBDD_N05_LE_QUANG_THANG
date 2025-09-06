import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  String get appTitle => locale.languageCode == 'vi' ? 'Tính BMI' : 'BMI Calculator';
  String get height => locale.languageCode == 'vi' ? 'Chiều cao (cm)' : 'Height (cm)';
  String get weight => locale.languageCode == 'vi' ? 'Cân nặng (kg)' : 'Weight (kg)';
  String get age => locale.languageCode == 'vi' ? 'Tuổi' : 'Age';
  String get calculate => locale.languageCode == 'vi' ? 'Tính toán' : 'Calculate';
  String get result => locale.languageCode == 'vi' ? 'Kết quả' : 'Result';
  String get underweight => locale.languageCode == 'vi' ? 'Thiếu cân' : 'Underweight';
  String get normal => locale.languageCode == 'vi' ? 'Bình thường' : 'Normal';
  String get overweight => locale.languageCode == 'vi' ? 'Thừa cân' : 'Overweight';
  String get obese => locale.languageCode == 'vi' ? 'Béo phì' : 'Obese';
  String get back => locale.languageCode == 'vi' ? 'Quay lại' : 'Back';
  String get saveResult => locale.languageCode == 'vi' ? 'Lưu kết quả' : 'Save Result'; // Thêm để dự phòng
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_) => false;
}