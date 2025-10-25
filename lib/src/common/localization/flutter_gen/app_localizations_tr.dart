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

  @override
  String get all => 'Tüm';

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
  String get preferences => 'Tercihler';

  @override
  String get myAccount => 'Hesabım';

  @override
  String get makeChangesToYourAccount => 'Hesabınızda değişiklik yapın';

  @override
  String get notification => 'Bildirim';

  @override
  String get manageYourAlertsAndUpdates =>
      'Uyarılarınızı ve güncellemelerinizi yönetin';

  @override
  String get language => 'Dil';

  @override
  String get setYourPreferredAppLanguage =>
      'Tercih ettiğiniz uygulama dilini ayarlayın';

  @override
  String get appearance => 'Görünüm';

  @override
  String get lightOrDarkYourChoice => 'Tema tercihini seç';

  @override
  String get support => 'Destek';

  @override
  String get help => 'Yardım';

  @override
  String get aboutUs => 'Hakkımızda';

  @override
  String get logOut => 'Çıkış Yap';

  @override
  String get furtherSecureYourAccountForSafety =>
      'Hesabınızı güvenlik için daha da güvenli hale getirin';

  @override
  String get booking => 'Rezervasyon';

  @override
  String get details => 'Ayrıntılar';

  @override
  String get brand => 'Marka';

  @override
  String get model => 'Model';

  @override
  String get year => 'Yıl';

  @override
  String get price => 'Fiyat';

  @override
  String get carSpecifications => 'Araç Özellikleri';

  @override
  String get horsepower => 'Beygir Gücü';

  @override
  String get seats => 'Koltuklar';

  @override
  String get per100km => '100 km Başına';

  @override
  String get rentalPlan => 'Kiralama Planı';

  @override
  String get hourly => 'Saatlik';

  @override
  String get daily => 'Günlük';

  @override
  String get weekly => 'Haftalık';

  @override
  String get slideToContinue => 'Devam etmek için kaydırın';

  @override
  String get day => 'Gün';

  @override
  String get subject => 'Konu';

  @override
  String get message => 'Mesaj';

  @override
  String get submit => 'Gönder';

  @override
  String get username => 'Kullanıcı Adı';

  @override
  String get fullName => 'Tam Ad';

  @override
  String get email => 'e-posta';

  @override
  String get dateOfBirth => 'Doğum Tarihi';

  @override
  String get update => 'Güncelle';

  @override
  String days(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün',
      one: '$count gün',
      zero: '0 gün',
    );
    return '$_temp0';
  }

  @override
  String get search => 'Ara...';

  @override
  String get history => 'Geçmiş';

  @override
  String get settings => 'Ayarlar';
}
