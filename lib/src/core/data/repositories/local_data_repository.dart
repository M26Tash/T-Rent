import 'dart:ui';

import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:t_rent/src/core/domain/interfaces/i_local_data_repository.dart';

final class LocalDataRepository implements ILocalDataRepository {
  final ILocalDataSource _localDataSource;

  LocalDataRepository(this._localDataSource);

  @override
  Future<String> readLocale() async {
    return _localDataSource.readLocale();
  }

  @override
  Future<String> readThemeType() async {
    return _localDataSource.readThemeType();
  }

  @override
  Future<void> writeLocale({required Locale locale}) async {
    return _localDataSource.writeLocale(
      locale: locale,
    );
  }

  @override
  Future<void> writeThemeType({required ThemeType themeType}) async {
    return _localDataSource.writeThemeType(
      themeType: themeType,
    );
  }
}
