import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalization
/// returned by `AppLocalization.of(context)`.
///
/// Applications need to include `AppLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalization.localizationsDelegates,
///   supportedLocales: AppLocalization.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalization.supportedLocales
/// property.
abstract class AppLocalization {
  AppLocalization(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @pleaseLoginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Please login to your account.'**
  String get pleaseLoginToYourAccount;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPasswordQ.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordQ;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @createYourAccountToStartYourRide.
  ///
  /// In en, this message translates to:
  /// **'Create your account to start your ride.'**
  String get createYourAccountToStartYourRide;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @enterYourRegisteredEmailAddressWeWillSendYouCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email address. We’ll send you a code to reset your password.'**
  String get enterYourRegisteredEmailAddressWeWillSendYouCode;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @setAStrongNewPasswordForYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Set a strong new password for your account.'**
  String get setAStrongNewPasswordForYourAccount;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @enterSixDigitCodeWeSentYou.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code we sent to your email to complete the reset.'**
  String get enterSixDigitCodeWeSentYou;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @nameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get nameCannotBeEmpty;

  /// No description provided for @nameMustBeAtLeastTwoCharsLong.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters long'**
  String get nameMustBeAtLeastTwoCharsLong;

  /// No description provided for @nameContainsInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'Name contains invalid characters'**
  String get nameContainsInvalidChars;

  /// No description provided for @emailCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailCannotBeEmpty;

  /// No description provided for @pleaseEnterAValidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterAValidEmailAddress;

  /// No description provided for @passwordCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passwordCannotBeEmpty;

  /// No description provided for @passwordMustBeAtLeastEightCharsLong.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get passwordMustBeAtLeastEightCharsLong;

  /// No description provided for @passwordCannotContainOnlyNumbers.
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain only numbers'**
  String get passwordCannotContainOnlyNumbers;

  /// No description provided for @passwordCannotContainOnlyLetters.
  ///
  /// In en, this message translates to:
  /// **'Password cannot contain only letters'**
  String get passwordCannotContainOnlyLetters;

  /// No description provided for @otpCodeCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'OTP Code cannot be empty'**
  String get otpCodeCannotBeEmpty;

  /// No description provided for @otpCodeContainsSixDigits.
  ///
  /// In en, this message translates to:
  /// **'OTP code contains 6 digits'**
  String get otpCodeContainsSixDigits;

  /// No description provided for @oopsThatCodeDoesntMatchTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Oops! That code doesn’t match. Try again.'**
  String get oopsThatCodeDoesntMatchTryAgain;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @suv.
  ///
  /// In en, this message translates to:
  /// **'SUV'**
  String get suv;

  /// No description provided for @sedan.
  ///
  /// In en, this message translates to:
  /// **'Sedan'**
  String get sedan;

  /// No description provided for @hatchback.
  ///
  /// In en, this message translates to:
  /// **'Hatchback'**
  String get hatchback;

  /// No description provided for @sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get sport;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pick-up'**
  String get pickup;

  /// No description provided for @minivan.
  ///
  /// In en, this message translates to:
  /// **'Minivan'**
  String get minivan;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @makeChangesToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Make changes to your account'**
  String get makeChangesToYourAccount;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @manageYourAlertsAndUpdates.
  ///
  /// In en, this message translates to:
  /// **'Manage your alerts and updates'**
  String get manageYourAlertsAndUpdates;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @setYourPreferredAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Set your preferred app language'**
  String get setYourPreferredAppLanguage;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @lightOrDarkYourChoice.
  ///
  /// In en, this message translates to:
  /// **'Light or Dark, your choice'**
  String get lightOrDarkYourChoice;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @furtherSecureYourAccountForSafety.
  ///
  /// In en, this message translates to:
  /// **'Further secure your account for safety'**
  String get furtherSecureYourAccountForSafety;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @carSpecifications.
  ///
  /// In en, this message translates to:
  /// **'Car Specifications'**
  String get carSpecifications;

  /// No description provided for @driveType.
  ///
  /// In en, this message translates to:
  /// **'Drive Type'**
  String get driveType;

  /// No description provided for @engineValue.
  ///
  /// In en, this message translates to:
  /// **'{value} cc'**
  String engineValue(Object value);

  /// No description provided for @engine.
  ///
  /// In en, this message translates to:
  /// **'Engine'**
  String get engine;

  /// No description provided for @horsepowerValue.
  ///
  /// In en, this message translates to:
  /// **'{value} HP'**
  String horsepowerValue(Object value);

  /// No description provided for @horsepower.
  ///
  /// In en, this message translates to:
  /// **'Horsepower'**
  String get horsepower;

  /// No description provided for @topSpeedValue.
  ///
  /// In en, this message translates to:
  /// **'{value} km/h'**
  String topSpeedValue(Object value);

  /// No description provided for @topSpeed.
  ///
  /// In en, this message translates to:
  /// **'Top Speed'**
  String get topSpeed;

  /// No description provided for @accelerationValue.
  ///
  /// In en, this message translates to:
  /// **'{value} s'**
  String accelerationValue(Object value);

  /// No description provided for @acceleration.
  ///
  /// In en, this message translates to:
  /// **'Acceleration'**
  String get acceleration;

  /// No description provided for @torqueValue.
  ///
  /// In en, this message translates to:
  /// **'{value} Nm'**
  String torqueValue(Object value);

  /// No description provided for @torque.
  ///
  /// In en, this message translates to:
  /// **'Torque'**
  String get torque;

  /// No description provided for @seats.
  ///
  /// In en, this message translates to:
  /// **'Seats'**
  String get seats;

  /// No description provided for @per100km.
  ///
  /// In en, this message translates to:
  /// **'Per 100 km'**
  String get per100km;

  /// No description provided for @rentalPlan.
  ///
  /// In en, this message translates to:
  /// **'Rental Plan'**
  String get rentalPlan;

  /// No description provided for @hourly.
  ///
  /// In en, this message translates to:
  /// **'Hourly'**
  String get hourly;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 days} one{{count} day} other{{count} days}}'**
  String days(num count);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @userDetails.
  ///
  /// In en, this message translates to:
  /// **'User Details'**
  String get userDetails;

  /// No description provided for @yourCarsReadyToRoll.
  ///
  /// In en, this message translates to:
  /// **'Your Car’s Ready to Roll!'**
  String get yourCarsReadyToRoll;

  /// No description provided for @bookingDetailsAreOnTheirWayToYourInbox.
  ///
  /// In en, this message translates to:
  /// **'Booking details are on their way to your inbox. Drive safe and enjoy the ride!'**
  String get bookingDetailsAreOnTheirWayToYourInbox;

  /// No description provided for @homePage.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get homePage;

  /// No description provided for @youHaventBookAnyCarsYet.
  ///
  /// In en, this message translates to:
  /// **'You haven’t booked any cars yet. Start your first rental and see it appear here!'**
  String get youHaventBookAnyCarsYet;
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(lookupAppLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}

AppLocalization lookupAppLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationEn();
    case 'tr':
      return AppLocalizationTr();
  }

  throw FlutterError(
      'AppLocalization.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
