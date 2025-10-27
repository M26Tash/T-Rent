import 'package:flutter/material.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';

abstract interface class ILocalDataRepository {
  Future<void> writeThemeType({required ThemeType themeType});

  Future<String> readThemeType();

  Future<void> writeLocale({required Locale locale});

  Future<String> readLocale();
}
