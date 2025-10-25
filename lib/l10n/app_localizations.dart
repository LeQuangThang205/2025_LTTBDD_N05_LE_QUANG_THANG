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
  /// **'Height'**
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

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'This app helps you track your BMI and maintain a healthier lifestyle.'**
  String get aboutDescription;

  /// No description provided for @aboutTeam.
  ///
  /// In en, this message translates to:
  /// **'Development Team'**
  String get aboutTeam;

  /// No description provided for @aboutTeamDetails.
  ///
  /// In en, this message translates to:
  /// **'Developed by passionate IT students who love health and technology.'**
  String get aboutTeamDetails;

  /// No description provided for @developerInfo.
  ///
  /// In en, this message translates to:
  /// **'Developer Info'**
  String get developerInfo;

  /// No description provided for @developerDetails.
  ///
  /// In en, this message translates to:
  /// **'Author: Le Quang Thang - Faculty of Information Technology.'**
  String get developerDetails;

  /// No description provided for @aboutContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get aboutContact;

  /// No description provided for @aboutContactDetails.
  ///
  /// In en, this message translates to:
  /// **'Email: yourname@gmail.com'**
  String get aboutContactDetails;

  /// No description provided for @appInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfoTitle;

  /// No description provided for @appInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0 - Built with Flutter.'**
  String get appInfoDescription;

  /// No description provided for @featuresTitle.
  ///
  /// In en, this message translates to:
  /// **'Main Features'**
  String get featuresTitle;

  /// No description provided for @featuresDescription.
  ///
  /// In en, this message translates to:
  /// **'Calculate BMI, track your health, and more.'**
  String get featuresDescription;

  /// No description provided for @bmiCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'BMI Categories'**
  String get bmiCategoriesTitle;

  /// No description provided for @bmiCategoriesDescription.
  ///
  /// In en, this message translates to:
  /// **'Includes: Underweight, Normal, Overweight, Obese.'**
  String get bmiCategoriesDescription;

  /// No description provided for @gettingStartedTitle.
  ///
  /// In en, this message translates to:
  /// **'Getting Started'**
  String get gettingStartedTitle;

  /// No description provided for @gettingStartedDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your data to calculate BMI quickly.'**
  String get gettingStartedDescription;

  /// No description provided for @techStackTitle.
  ///
  /// In en, this message translates to:
  /// **'Technology Stack'**
  String get techStackTitle;

  /// No description provided for @techStackDescription.
  ///
  /// In en, this message translates to:
  /// **'Flutter, Dart, Firebase, Material Design.'**
  String get techStackDescription;

  /// No description provided for @customizationTitle.
  ///
  /// In en, this message translates to:
  /// **'Customization'**
  String get customizationTitle;

  /// No description provided for @customizationDescription.
  ///
  /// In en, this message translates to:
  /// **'Easily switch between English and Vietnamese.'**
  String get customizationDescription;

  /// No description provided for @healthJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Journey'**
  String get healthJourneyTitle;

  /// No description provided for @healthJourneyDescription.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and improve your health.'**
  String get healthJourneyDescription;

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
