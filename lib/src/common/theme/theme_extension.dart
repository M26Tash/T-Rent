import 'package:flutter/material.dart';
import 'package:t_rent/src/common/theme/t_rent_theme.dart';
import 'package:t_rent/src/common/theme/theme_provider.dart';

extension ThemeExtension on BuildContext {
  TRentTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}
