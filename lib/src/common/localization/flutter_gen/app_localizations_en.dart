// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get pleaseLoginToYourAccount => 'Please login to your account.';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get forgotPasswordQ => 'Forgot Password?';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get login => 'Login';

  @override
  String get dontHaveAnAccount => 'Don’t have an account?';

  @override
  String get register => 'Register';

  @override
  String get signUp => 'Sign up';

  @override
  String get createYourAccountToStartYourRide =>
      'Create your account to start your ride.';

  @override
  String get name => 'Name';

  @override
  String get alreadyHaveAnAccount => 'Already have an account?';

  @override
  String get enterYourRegisteredEmailAddressWeWillSendYouCode =>
      'Enter your registered email address. We’ll send you a code to reset your password.';

  @override
  String get continues => 'Continue';

  @override
  String get createNewPassword => 'Create New Password';

  @override
  String get setAStrongNewPasswordForYourAccount =>
      'Set a strong new password for your account.';

  @override
  String get previous => 'Previous';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get enterSixDigitCodeWeSentYou =>
      'Enter the 6-digit code we sent to your email to complete the reset.';

  @override
  String get verify => 'Verify';

  @override
  String get cancel => 'Cancel';

  @override
  String get nameCannotBeEmpty => 'Name cannot be empty';

  @override
  String get nameMustBeAtLeastTwoCharsLong =>
      'Name must be at least 2 characters long';

  @override
  String get nameContainsInvalidChars => 'Name contains invalid characters';

  @override
  String get emailCannotBeEmpty => 'Email cannot be empty';

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Please enter a valid email address';

  @override
  String get passwordCannotBeEmpty => 'Password cannot be empty';

  @override
  String get passwordMustBeAtLeastEightCharsLong =>
      'Password must be at least 8 characters long';

  @override
  String get passwordCannotContainOnlyNumbers =>
      'Password cannot contain only numbers';

  @override
  String get passwordCannotContainOnlyLetters =>
      'Password cannot contain only letters';

  @override
  String get otpCodeCannotBeEmpty => 'OTP Code cannot be empty';

  @override
  String get otpCodeContainsSixDigits => 'OTP code contains 6 digits';

  @override
  String get oopsThatCodeDoesntMatchTryAgain =>
      'Oops! That code doesn’t match. Try again.';

  @override
  String get all => 'All';

  @override
  String get suv => 'SUV';

  @override
  String get sedan => 'Sedan';

  @override
  String get hatchback => 'Hatchback';

  @override
  String get sport => 'Sport';

  @override
  String get pickup => 'Pick-up';

  @override
  String get minivan => 'Minivan';

  @override
  String get preferences => 'Preferences';

  @override
  String get myAccount => 'My Account';

  @override
  String get makeChangesToYourAccount => 'Make changes to your account';

  @override
  String get notification => 'Notification';

  @override
  String get manageYourAlertsAndUpdates => 'Manage your alerts and updates';

  @override
  String get language => 'Language';

  @override
  String get setYourPreferredAppLanguage => 'Set your preferred app language';

  @override
  String get appearance => 'Appearance';

  @override
  String get lightOrDarkYourChoice => 'Light or Dark, your choice';

  @override
  String get support => 'Support';

  @override
  String get help => 'Help';

  @override
  String get aboutUs => 'About Us';

  @override
  String get logOut => 'Log out';

  @override
  String get furtherSecureYourAccountForSafety =>
      'Further secure your account for safety';

  @override
  String get booking => 'Booking';

  @override
  String get details => 'Details';

  @override
  String get brand => 'Brand';

  @override
  String get model => 'Model';

  @override
  String get year => 'Year';

  @override
  String get price => 'price';

  @override
  String get carSpecifications => 'Car Specifications';

  @override
  String get horsepower => 'Horsepower';

  @override
  String get seats => 'Seats';

  @override
  String get per100km => 'Per 100 km';

  @override
  String get rentalPlan => 'Rental Plan';

  @override
  String get hourly => 'Hourly';

  @override
  String get daily => 'Daily';

  @override
  String get weekly => 'Weekly';

  @override
  String get slideToContinue => 'Slide to continue';

  @override
  String get day => 'Day';

  @override
  String get subject => 'Subject';

  @override
  String get message => 'Message';

  @override
  String get submit => 'Submit';

  @override
  String get username => 'Username';

  @override
  String get fullName => 'Full name';

  @override
  String get email => 'email';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get update => 'Update';

  @override
  String days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '$count day',
      zero: '0 days',
    );
    return '$_temp0';
  }

  @override
  String get search => 'Search...';

  @override
  String get history => 'History';

  @override
  String get settings => 'Settings';
}
