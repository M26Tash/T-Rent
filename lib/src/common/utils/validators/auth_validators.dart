import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';

class AuthValidators {
  final BuildContext context;
  AuthValidators(this.context);

  String? validateName(String value) {
    if (value.trim().isEmpty) {
      return context.locale.nameCannotBeEmpty;
    } else if (value.trim().length < 2) {
      return context.locale.nameMustBeAtLeastTwoCharsLong;
    } else if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
      return context.locale.nameContainsInvalidChars;
    }
    return null;
  }

  String? validateEmail(String value) {
    final isValid = EmailValidator.validate(value);

    if (value.isEmpty) {
      return context.locale.emailCannotBeEmpty;
    } else if (isValid == false) {
      return context.locale.pleaseEnterAValidEmailAddress;
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return context.locale.passwordCannotBeEmpty;
    } else if (value.length < 8) {
      return context.locale.passwordMustBeAtLeastEightCharsLong;
    } else if (RegExp(r'^[0-9]+$').hasMatch(value)) {
      return context.locale.passwordCannotContainOnlyNumbers;
    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return context.locale.passwordCannotContainOnlyLetters;
    }
    return null;
  }

  String? validateOtpCode(String value, String otpCode) {
    if (value.isEmpty) {
      return context.locale.otpCodeCannotBeEmpty;
    } else if (value.length < 6) {
      return context.locale.otpCodeContainsSixDigits;
    } else if (value != otpCode) {
      return context.locale.oopsThatCodeDoesntMatchTryAgain;
    }

    return null;
  }
}
