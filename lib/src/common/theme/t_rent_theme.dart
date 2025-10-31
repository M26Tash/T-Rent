import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class TRentTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color surfaceColor;
  final Color overlayBackgroundColor;
  final Color electricSurfaceColor;

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
  final Color whiteIconColor;

  final Color activeBottomNavIcon;
  final Color inActiveBottomNavIcon;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color accentTextColor;
  final Color hintTextColor;
  final Color buttonTextColor;

  final Color profileNameColor;
  final Color profileEmailColor;

  final Color activeTabTextColor;
  final Color inActiveTabTextColor;

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
        electricSurfaceColor,
        primaryColor,
        accentColor,
        errorColor,
        successColor,
        warningColor,
        borderColor,
        primaryIconColor,
        secondaryIconColor,
        tertiaryIconColor,
        whiteIconColor,
        activeBottomNavIcon,
        inActiveBottomNavIcon,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        tertiaryTextColor,
        accentTextColor,
        hintTextColor,
        buttonTextColor,
        profileNameColor,
        profileEmailColor,
        activeTabTextColor,
        inActiveTabTextColor,
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
    required this.electricSurfaceColor,
    required this.primaryColor,
    required this.accentColor,
    required this.errorColor,
    required this.successColor,
    required this.warningColor,
    required this.borderColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.tertiaryIconColor,
    required this.whiteIconColor,
    required this.activeBottomNavIcon,
    required this.inActiveBottomNavIcon,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.accentTextColor,
    required this.hintTextColor,
    required this.buttonTextColor,
    required this.profileNameColor,
    required this.profileEmailColor,
    required this.activeTabTextColor,
    required this.inActiveTabTextColor,
    required this.shadowColor,
    required this.fontFamily,
    required this.statusBarTheme,
    required this.navigationBarBrightness,
  });
}
