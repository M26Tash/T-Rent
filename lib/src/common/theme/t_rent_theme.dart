import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class TRentTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color surfaceColor;

  final Color primaryColor;
  final Color secondaryColor;

  final Color errorColor;
  final Color successColor;
  final Color warningColor;

  final Color borderColor;

  final Color transparent;

  final Color primaryIconColor;
  final Color secondaryIconColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;

  final String fontFamily;

  final Brightness statusBarTheme;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
        isDark,
        backgroundColor,
        surfaceColor,
        primaryColor,
        secondaryColor,
        errorColor,
        successColor,
        warningColor,
        borderColor,
        primaryIconColor,
        secondaryIconColor,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        fontFamily,
        statusBarTheme,
        navigationBarBrightness,
      ];

  const TRentTheme({
    required this.isDark,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.successColor,
    required this.warningColor,
    required this.borderColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.fontFamily,
    required this.statusBarTheme,
    required this.navigationBarBrightness,
  });
}
