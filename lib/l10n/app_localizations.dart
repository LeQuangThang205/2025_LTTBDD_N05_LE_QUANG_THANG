import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'BMI Calculator App'**
  String get appTitle;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get height;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @calculateNow.
  ///
  /// In en, this message translates to:
  /// **'Calculate Now'**
  String get calculateNow;

  /// No description provided for @blog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blog;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @trendChart.
  ///
  /// In en, this message translates to:
  /// **'BMI Trend Chart'**
  String get trendChart;

  /// No description provided for @noHistoryData.
  ///
  /// In en, this message translates to:
  /// **'No history data available'**
  String get noHistoryData;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @result.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// No description provided for @bmiResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Your BMI Result'**
  String get bmiResultTitle;

  /// No description provided for @bmiValue.
  ///
  /// In en, this message translates to:
  /// **'BMI Value'**
  String get bmiValue;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @advice.
  ///
  /// In en, this message translates to:
  /// **'Advice'**
  String get advice;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @underweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get underweight;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @overweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get overweight;

  /// No description provided for @obese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get obese;

  /// No description provided for @eatHealthy.
  ///
  /// In en, this message translates to:
  /// **'You should eat more nutritious food!'**
  String get eatHealthy;

  /// No description provided for @maintain.
  ///
  /// In en, this message translates to:
  /// **'Keep up your healthy lifestyle!'**
  String get maintain;

  /// No description provided for @exerciseMore.
  ///
  /// In en, this message translates to:
  /// **'Exercise more regularly!'**
  String get exerciseMore;

  /// No description provided for @consultDoctor.
  ///
  /// In en, this message translates to:
  /// **'Consider consulting a doctor!'**
  String get consultDoctor;

  /// No description provided for @weightChange.
  ///
  /// In en, this message translates to:
  /// **'Your current weight: '**
  String get weightChange;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the BMI Calculator App!'**
  String get welcomeMessage;

  /// No description provided for @calculateBmi.
  ///
  /// In en, this message translates to:
  /// **'Calculate BMI'**
  String get calculateBmi;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @vietnamese.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get vietnamese;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About the Application'**
  String get aboutTitle;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'BMI Calculator App'**
  String get appName;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Keep your body in perfect shape with our friendly BMI Tracker! A smart and easy-to-use Body Mass Index (BMI) calculator designed for everyone — men, women, teens, and adults. Whether you\'re aiming to lose weight, gain muscle, or maintain balance, this app is your best health companion!'**
  String get aboutDescription;

  /// No description provided for @sectionFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ What\'s Inside?'**
  String get sectionFeaturesTitle;

  /// No description provided for @sectionFeaturesBody.
  ///
  /// In en, this message translates to:
  /// **'Discover a powerful tool packed in a minimal yet stylish interface that helps you start a healthy lifestyle today. Easily calculate your BMI, track progress, and get personalized tips — all for free!'**
  String get sectionFeaturesBody;

  /// No description provided for @sectionHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'🌟 Key Features'**
  String get sectionHighlightsTitle;

  /// No description provided for @sectionHighlightsBody.
  ///
  /// In en, this message translates to:
  /// **'• Offline Mode: No internet needed — use anytime, anywhere!\n• Accurate BMI: Based on age, gender, height, and weight.\n• BMI Classification: Instantly see which category you fall into.\n• Ideal Weight Suggestion: Based on your height.\n• Flexible Units: Switch between Metric (kg, cm) and Imperial (lbs, ft).\n• History Tracking: Log your BMI journey with detailed records.\n• Health Tips: Personalized advice for your fitness goals.\n• UI Mode: Light / Dark themes.\n• Multi-Language Support: English and Vietnamese.\n• Simple Design: Modern and intuitive interface.\n• Completely Free: No hidden costs!'**
  String get sectionHighlightsBody;

  /// No description provided for @sectionCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'📊 BMI Categories'**
  String get sectionCategoriesTitle;

  /// No description provided for @sectionCategoriesBody.
  ///
  /// In en, this message translates to:
  /// **'Range\tClassification\n< 16\tSeverely Underweight\n16 - 17\tModerately Underweight\n17 - 18.5\tMildly Underweight\n18.5 - 25\tNormal\n25 - 30\tOverweight\n30 - 35\tObese Class I\n35 - 40\tObese Class II\n> 40\tObese Class III'**
  String get sectionCategoriesBody;

  /// No description provided for @sectionWhatIsBMITitle.
  ///
  /// In en, this message translates to:
  /// **'🤔 What is BMI?'**
  String get sectionWhatIsBMITitle;

  /// No description provided for @sectionWhatIsBMIBody.
  ///
  /// In en, this message translates to:
  /// **'Body Mass Index (BMI) is a reliable indicator to estimate body fat based on height and weight for both men and women. It is calculated as weight (kg) divided by height squared (m²). This app also uses age and gender to improve accuracy and give a clearer picture of your health.'**
  String get sectionWhatIsBMIBody;

  /// No description provided for @sectionGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'🚀 Getting Started'**
  String get sectionGuideTitle;

  /// No description provided for @sectionGuideBody.
  ///
  /// In en, this message translates to:
  /// **'Usage:\n• Enter Info: Fill in gender, age, weight, and height.\n• Calculate: Tap \'Calculate\' to view your BMI and category.\n• Explore: Check your ideal weight, BMR, and health advice.\n• Track: View your history and trends for motivation.\n\nRequirements:\n• Flutter SDK 3.0.0 or later.\n• IDE: Android Studio, VS Code, or any Flutter-supported editor.\n• Dependencies: Install required packages via pubspec.yaml.\n\nInstallation:\n• Clone repository: git clone https://github.com/LeQuangThang205/2025_LTTBDD_N05_LE_QUANG_THANG.git\n• Enter project folder: cd bmi_calculator_app\n• Install dependencies: flutter pub get\n• Run app: flutter run'**
  String get sectionGuideBody;

  /// No description provided for @sectionTechTitle.
  ///
  /// In en, this message translates to:
  /// **'🛠️ Technologies Used'**
  String get sectionTechTitle;

  /// No description provided for @sectionTechBody.
  ///
  /// In en, this message translates to:
  /// **'• Framework: Flutter (Dart)\n• Localization: intl\n• UI Libraries: fl_chart, custom animations\n• Storage: shared_preferences\n• Sharing: share_plus\n• Assets: Custom backgrounds and splash logos'**
  String get sectionTechBody;

  /// No description provided for @sectionCustomizeTitle.
  ///
  /// In en, this message translates to:
  /// **'🎨 Customization'**
  String get sectionCustomizeTitle;

  /// No description provided for @sectionCustomizeBody.
  ///
  /// In en, this message translates to:
  /// **'• Change background: assets/images/home.jpg (1080x1920px)\n• Splash logo: assets/images/splash_logo.png (1024x1024px)\n• Edit theme colors: in main.dart ThemeData'**
  String get sectionCustomizeBody;

  /// No description provided for @sectionJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'🌱 Your Health Journey'**
  String get sectionJourneyTitle;

  /// No description provided for @sectionJourneyBody.
  ///
  /// In en, this message translates to:
  /// **'Start today with BMI Calculator App! Track your BMI, receive useful tips, and share your progress with friends.\n\nIf you have suggestions, submit an issue or pull request on GitHub.\n\nDeveloped with ❤️ by LÊ QUANG THẮNG.'**
  String get sectionJourneyBody;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
