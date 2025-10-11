import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/constants/font_family.dart';
import 'package:t_rent/src/common/theme/t_rent_theme.dart';

const _papayaWhip = Color(0xFFFDF0D5);
const _white = Color(0xFFFFFFFF);
const _lava = Color(0xFFC1121F);
const _prussianBlue = Color(0xFF003049);
const _maroon = Color(0xFF780000);
const _maastrichtBlue = Color(0xFF001D2D);
const _policeBlue = Color(0xFF334E66);
const _chineseWhite = Color(0xFFE0E0E0);
const _creuleanForest = Color(0xFF669BBC);
const _marigold = Color(0xFFF5A623);

const _transparent = Color(0x00000000);

const lightTheme = TRentTheme(
  isDark: false,
  backgroundColor: _papayaWhip,
  surfaceColor: _white,
  primaryColor: _lava,
  secondaryColor: _creuleanForest,
  errorColor: _lava,
  successColor: _creuleanForest,
  warningColor: _marigold,
  borderColor: _chineseWhite,
  primaryIconColor: _white,
  secondaryIconColor: _white,
  transparent: _transparent,
  primaryTextColor: _prussianBlue,
  secondaryTextColor: _maroon,
  fontFamily: FontFamily.robotoFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.light,
);

const darkTheme = TRentTheme(
  isDark: true,
  backgroundColor: _prussianBlue,
  surfaceColor: _maastrichtBlue,
  primaryColor: _lava,
  secondaryColor: _creuleanForest,
  errorColor: _lava,
  successColor: _creuleanForest,
  warningColor: _papayaWhip,
  borderColor: _policeBlue,
  primaryIconColor: _white,
  secondaryIconColor: _white,
  transparent: _transparent,
  primaryTextColor: _papayaWhip,
  secondaryTextColor: _maroon,
  fontFamily: FontFamily.robotoFamily,
  statusBarTheme: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
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
