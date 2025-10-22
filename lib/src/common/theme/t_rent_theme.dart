import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class TRentTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color surfaceColor;
  final Color overlayBackgroundColor;

  final Color primaryColor;
  final Color accentColor;

  final Color errorColor;
  final Color successColor;
  final Color warningColor;

  final Color borderColor;

  final Color transparent;

  final Color primaryIconColor;
  final Color secondaryIconColor;
  final Color tertiaryIconColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color accentTextColor;
  final Color hintTextColor;
  final Color buttonTextColor;

  final Color shadowColor;

  final String fontFamily;

  final Brightness statusBarTheme;
  final Brightness navigationBarBrightness;

  @override
  List<Object?> get props => [
        isDark,
        backgroundColor,
        surfaceColor,
        overlayBackgroundColor,
        primaryColor,
        accentColor,
        errorColor,
        successColor,
        warningColor,
        borderColor,
        primaryIconColor,
        secondaryIconColor,
        tertiaryIconColor,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        tertiaryTextColor,
        accentTextColor,
        hintTextColor,
        buttonTextColor,
        shadowColor,
        fontFamily,
        statusBarTheme,
        navigationBarBrightness,
      ];

  const TRentTheme({
    required this.isDark,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.overlayBackgroundColor,
    required this.primaryColor,
    required this.accentColor,
    required this.errorColor,
    required this.successColor,
    required this.warningColor,
    required this.borderColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.tertiaryIconColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.accentTextColor,
    required this.hintTextColor,
    required this.buttonTextColor,
    required this.shadowColor,
    required this.fontFamily,
    required this.statusBarTheme,
    required this.navigationBarBrightness,
  });
}
