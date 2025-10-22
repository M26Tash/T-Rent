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
  primaryColor: _rosewood,
  accentColor: _blood,
  primaryIconColor: _darkJungleGreen,
  secondaryIconColor: _philippineGray,
  tertiaryIconColor: _white,
  transparent: _transparent,
  primaryTextColor: _darkJungleGreen,
  secondaryTextColor: _outerSpace,
  tertiaryTextColor: _white,
  accentTextColor: _blood,
  hintTextColor: _philippineGray,
  buttonTextColor: _white,
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
  primaryColor: _rosewood,
  accentColor: _blood,
  primaryIconColor: _white,
  secondaryIconColor: _philippineGray,
  tertiaryIconColor: _darkJungleGreen,
  transparent: _transparent,
  primaryTextColor: _white,
  secondaryTextColor: _chineseWhite,
  tertiaryTextColor: _darkJungleGreen,
  accentTextColor: _blood,
  hintTextColor: _philippineGray,
  buttonTextColor: _white,
  shadowColor: _chineseWhite,
  fontFamily: FontFamily.montserratFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
  errorColor: _vermilion,
  successColor: _spanishGreen,
  warningColor: _metallicOrange,
  borderColor: _philippineGray,
);

// const _eerieBlack = Color(0xFF161622);
// const _white = Color(0xFFFFFFFF);
// const _romanSilver = Color(0xFF7E848D);
// const _philipineGray = Color(0xFF8B8B94);
// const _quickSilver = Color(0xFFA2A2A7);
// const _ = Color(0xFF);
// const _ = Color(0xFF);
// const _ = Color(0xFF);

// const _transparent = Color(0x00000000);

// const lightTheme = TRentTheme(
//   isDark: false,
//   backgroundColor: _white,
//   surfaceColor: _transparent,
//   primaryColor: _policeBlue,
//   secondaryColor: _silverSand,
//   accentColor: _acidGreen,
//   errorColor: _transparent,
//   successColor: _transparent,
//   warningColor: _transparent,
//   borderColor: _transparent,
//   primaryIconColor: _transparent,
//   secondaryIconColor: _transparent,
//   transparent: _transparent,
//   primaryTextColor: _eerieBlack,
//   secondaryTextColor: _policeBlue,
//   fontFamily: FontFamily.carmeFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.light,
// );

// const darkTheme = TRentTheme(
//   isDark: true,
//   backgroundColor: _black,
//   surfaceColor: _transparent,
//   primaryColor: _darkSkyBlue,
//   secondaryColor: _arsenic,
//   accentColor: _pear,
//   errorColor: _transparent,
//   successColor: _transparent,
//   warningColor: _transparent,
//   borderColor: _transparent,
//   primaryIconColor: _transparent,
//   secondaryIconColor: _transparent,
//   transparent: _transparent,
//   primaryTextColor: _chineeseWhite,
//   secondaryTextColor: _darkSkyBlue,
//   fontFamily: FontFamily.carmeFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.light,
// );

// const _eerieBlack = Color(0xFF1F1F1F);
// const _white = Color(0xFFffffff);
// const _policeBlue = Color(0xFF325B67);
// const _silverSand = Color(0xFFB5C4C2);
// const _acidGreen = Color(0xFFC1CA1C);

// const _chineeseWhite = Color(0xFFE0E0E0);
// const _black = Color(0xFF000000);
// const _darkSkyBlue = Color(0xFF98C1CD);
// const _arsenic = Color(0xFF3B4A48);
// const _pear = Color(0xFFDBE335);

// const _transparent = Color(0x00000000);

// const lightTheme = TRentTheme(
//   isDark: false,
//   backgroundColor: _white,
//   surfaceColor: _transparent,
//   primaryColor: _policeBlue,
//   secondaryColor: _silverSand,
//   accentColor: _acidGreen,
//   errorColor: _transparent,
//   successColor: _transparent,
//   warningColor: _transparent,
//   borderColor: _transparent,
//   primaryIconColor: _transparent,
//   secondaryIconColor: _transparent,
//   transparent: _transparent,
//   primaryTextColor: _eerieBlack,
//   secondaryTextColor: _policeBlue,
//   fontFamily: FontFamily.carmeFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.light,
// );

// const darkTheme = TRentTheme(
//   isDark: true,
//   backgroundColor: _black,
//   surfaceColor: _transparent,
//   primaryColor: _darkSkyBlue,
//   secondaryColor: _arsenic,
//   accentColor: _pear,
//   errorColor: _transparent,
//   successColor: _transparent,
//   warningColor: _transparent,
//   borderColor: _transparent,
//   primaryIconColor: _transparent,
//   secondaryIconColor: _transparent,
//   transparent: _transparent,
//   primaryTextColor: _chineeseWhite,
//   secondaryTextColor: _darkSkyBlue,
//   fontFamily: FontFamily.carmeFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.light,
// );

// const _papayaWhip = Color(0xFFFDF0D5);
// const _white = Color(0xFFFFFFFF);
// const _lava = Color(0xFFC1121F);
// const _prussianBlue = Color(0xFF003049);
// const _maroon = Color(0xFF780000);
// const _maastrichtBlue = Color(0xFF001D2D);
// const _policeBlue = Color(0xFF334E66);
// const _chineseWhite = Color(0xFFE0E0E0);
// const _creuleanForest = Color(0xFF669BBC);
// const _marigold = Color(0xFFF5A623);

// const lightTheme = TRentTheme(
//   isDark: false,
//   backgroundColor: _papayaWhip,
//   surfaceColor: _white,
//   primaryColor: _lava,
//   secondaryColor: _creuleanForest,
//   errorColor: _lava,
//   successColor: _creuleanForest,
//   warningColor: _marigold,
//   borderColor: _chineseWhite,
//   primaryIconColor: _white,
//   secondaryIconColor: _white,
//   transparent: _transparent,
//   primaryTextColor: _prussianBlue,
//   secondaryTextColor: _maroon,
//   fontFamily: FontFamily.robotoFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.light,
// );

// const darkTheme = TRentTheme(
//   isDark: true,
//   backgroundColor: _prussianBlue,
//   surfaceColor: _maastrichtBlue,
//   primaryColor: _lava,
//   secondaryColor: _creuleanForest,
//   errorColor: _lava,
//   successColor: _creuleanForest,
//   warningColor: _papayaWhip,
//   borderColor: _policeBlue,
//   primaryIconColor: _white,
//   secondaryIconColor: _white,
//   transparent: _transparent,
//   primaryTextColor: _papayaWhip,
//   secondaryTextColor: _maroon,
//   fontFamily: FontFamily.robotoFamily,
//   statusBarTheme: Brightness.dark,
//   navigationBarBrightness: Brightness.dark,
// );

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
