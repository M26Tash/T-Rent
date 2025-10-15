// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationTr extends AppLocalization {
  AppLocalizationTr([String locale = 'tr']) : super(locale);

  @override
  String get welcomeBack => 'Tekrar Hoş Geldiniz';

  @override
  String get pleaseLoginToYourAccount => 'Lütfen hesabınıza giriş yapın.';

  @override
  String get emailAddress => 'E-posta Adresi';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPasswordQ => 'Şifremi unuttum?';

  @override
  String get forgotPassword => 'Şifremi unuttum';

  @override
  String get login => 'Giriş Yap';

  @override
  String get dontHaveAnAccount => 'Hesabınız yok mu?';

  @override
  String get register => 'Kaydol';

  @override
  String get signUp => 'Kaydol';

  @override
  String get createYourAccountToStartYourRide =>
      'Yolculuğunuza başlamak için hesabınızı oluşturun.';

  @override
  String get name => 'Ad';

  @override
  String get alreadyHaveAnAccount => 'Zaten bir hesabınız var mı?';

  @override
  String get enterYourRegisteredEmailAddressWeWillSendYouCode =>
      'Kayıtlı e-posta adresinizi girin. Şifrenizi sıfırlamanız için size bir kod göndereceğiz.';

  @override
  String get continues => 'Devam';

  @override
  String get createNewPassword => 'Yeni Şifre Oluştur';

  @override
  String get setAStrongNewPasswordForYourAccount =>
      'Hesabınız için güçlü bir yeni şifre belirleyin.';

  @override
  String get previous => 'Önceki';

  @override
  String get verifyOtp => 'OTP\'yi Doğrula';

  @override
  String get enterSixDigitCodeWeSentYou =>
      'Sıfırlamayı tamamlamak için e-postanıza gönderdiğimiz 6 haneli kodu girin.';

  @override
  String get verify => 'Doğrula';

  @override
  String get cancel => 'İptal';

  @override
  String get nameCannotBeEmpty => 'Ad boş olamaz';

  @override
  String get nameMustBeAtLeastTwoCharsLong =>
      'Ad en az 2 karakter uzunluğunda olmalıdır';

  @override
  String get nameContainsInvalidChars => 'Ad geçersiz karakterler içeriyor';

  @override
  String get emailCannotBeEmpty => 'E-posta empty';

  @override
  String get pleaseEnterAValidEmailAddress =>
      'Lütfen geçerli bir e-posta adresi girin';

  @override
  String get passwordCannotBeEmpty => 'Şifre boş olamaz';

  @override
  String get passwordMustBeAtLeastEightCharsLong =>
      'Şifre en az 8 karakter uzunluğunda olmalıdır';

  @override
  String get passwordCannotContainOnlyNumbers =>
      'Şifre yalnızca rakam içeremez';

  @override
  String get passwordCannotContainOnlyLetters => 'Şifre yalnızca harf içeremez';

  @override
  String get otpCodeCannotBeEmpty => 'OTP Kodu boş olamaz';

  @override
  String get otpCodeContainsSixDigits => 'OTP kodu 6 hane içeriyor';

  @override
  String get oopsThatCodeDoesntMatchTryAgain =>
      'Hata! Bu kod eşleşmiyor. Tekrar deneyin.';
}
