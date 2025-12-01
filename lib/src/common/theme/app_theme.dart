// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/constants/font_family.dart';
import 'package:t_rent/src/common/theme/t_rent_theme.dart';

const _rosewood = Color(0xFF660708);
const _blood = Color(0xFFa4161a);
const _cultured = Color(0xFFF5F5F5);
const _philippineGray = Color(0xFF929292);
const _darkJungleGreen = Color(0xFF1D1F21);
const _white = Color(0xFFFFFFFF);
const _outerSpace = Color(0xFF444648);
const _chineseWhite = Color(0xFFE0E0E0);
const _darkCharcoal = Color(0xFF2C2E30);
const _chineseSilver = Color(0xFFCCCCCC);
const _inchworm = Color(0xFFB9FF66);
const _inchwormDark = Color(0xFFa4d963);

const _transparent = Color(0x00000000);

// Error, Success, Warning LIGHT UI
// ! CHANGE COLORS
const _bittersweet = Color(0xFFF97066);
const _brightYellow = Color(0xFFFDB022);
const _ufoGreen = Color(0xFF32D583);

// Error, Success, Warning DARK UI
// ! CHANGE COLORS
const _vermilion = Color(0xFFD92D20);
const _metallicOrange = Color(0xFFDC6803);
const _spanishGreen = Color(0xFF039855);

const lightTheme = TRentTheme(
  isDark: false,
  backgroundColor: _white,
  surfaceColor: _cultured,
  overlayBackgroundColor: _chineseSilver,
  electricSurfaceColor: _inchworm,
  primaryColor: _rosewood,
  accentColor: _blood,
  primaryIconColor: _darkJungleGreen,
  secondaryIconColor: _philippineGray,
  tertiaryIconColor: _white,
  whiteIconColor: _white,
  activeBottomNavIcon: _white,
  inActiveBottomNavIcon: _philippineGray,
  transparent: _transparent,
  primaryTextColor: _darkJungleGreen,
  secondaryTextColor: _outerSpace,
  tertiaryTextColor: _white,
  accentTextColor: _blood,
  hintTextColor: _philippineGray,
  buttonTextColor: _white,
  specsTextColor: _white,
  profileNameColor: _white,
  profileEmailColor: _chineseWhite,
  activeTabTextColor: _white,
  inActiveTabTextColor: _blood,
  shadowColor: _darkJungleGreen,
  fontFamily: FontFamily.montserratFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.light,
  errorColor: _vermilion,
  successColor: _ufoGreen,
  warningColor: _brightYellow,
  borderColor: _philippineGray,
);

const darkTheme = TRentTheme(
  isDark: true,
  backgroundColor: _darkJungleGreen,
  surfaceColor: _darkCharcoal,
  overlayBackgroundColor: _outerSpace,
  electricSurfaceColor: _inchwormDark,
  primaryColor: _rosewood,
  accentColor: _blood,
  primaryIconColor: _white,
  secondaryIconColor: _philippineGray,
  tertiaryIconColor: _darkJungleGreen,
  whiteIconColor: _white,
  activeBottomNavIcon: _white,
  inActiveBottomNavIcon: _philippineGray,
  transparent: _transparent,
  primaryTextColor: _white,
  secondaryTextColor: _chineseWhite,
  tertiaryTextColor: _darkJungleGreen,
  accentTextColor: _blood,
  hintTextColor: _philippineGray,
  buttonTextColor: _white,
  specsTextColor: _white,
  profileNameColor: _white,
  profileEmailColor: _chineseWhite,
  activeTabTextColor: _white,
  inActiveTabTextColor: _blood,
  shadowColor: _chineseWhite,
  fontFamily: FontFamily.montserratFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
  errorColor: _vermilion,
  successColor: _spanishGreen,
  warningColor: _metallicOrange,
  borderColor: _philippineGray,
);

ThemeData generateThemeData(TRentTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.primaryColor,
      selectionHandleColor: theme.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineLarge,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparent,
        statusBarIconBrightness: theme.statusBarTheme,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
