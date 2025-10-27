import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:t_rent/src/core/domain/utils/core_logger.dart';

class LocalDataSource implements ILocalDataSource {
  @override
  Future<String> readLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      CoreLogger.infoLog(
        'locale successfully red | ${prefs.getString('locale')}',
      );
      return prefs.getString('locale') ?? '${const Locale('en')}';
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'Something went wrong {[readLocale]}',
        params: {
          'error': e,
        },
      );
    }

    return '';
  }

  @override
  Future<String> readThemeType() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      CoreLogger.infoLog(
        'theme type successfully red | ${prefs.getString('theme_type')}',
      );
      return prefs.getString('theme_type') ?? '${ThemeType.light}';
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'Something went wrong {[readThemeType]}',
        params: {
          'error': e,
        },
      );
    }
    return '';
  }

  @override
  Future<void> writeLocale({required Locale locale}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', '$locale');
      CoreLogger.infoLog('locale successfully saved | $locale');
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'Something went wrong {[writeLocale]}',
        params: {'error': e},
      );
    }
  }

  @override
  Future<void> writeThemeType({required ThemeType themeType}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme_type', '$themeType');
      CoreLogger.infoLog('theme type successfully saved | $themeType');
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'Something went wrong {[writeThemeType]}',
        params: {'error': e},
      );
    }
  }
}
