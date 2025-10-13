import 'package:email_validator/email_validator.dart';

class AuthValidators {
  static String? validateName(String value) {
    if (value.trim().isEmpty) {
      return 'Name cannot be empty';
    } else if (value.trim().length < 2) {
      return 'Name must be at least 2 characters long';
    } else if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
      return 'Name contains invalid characters';
    }
    return null;
  }

  static String? validateEmail(String value) {
    final isValid = EmailValidator.validate(value);

    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (isValid == false) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Password cannot contain only numbers';
    } else if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Password cannot contain only letters';
    }
    return null;
  }
}
