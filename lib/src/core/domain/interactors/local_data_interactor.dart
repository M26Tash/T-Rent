import 'package:flutter/cupertino.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/core/domain/interfaces/i_local_data_repository.dart';

final class LocalDataInteractor {
  final ILocalDataRepository _localDataRepository;

  LocalDataInteractor(this._localDataRepository);

  Future<void> writeThemeType({
    required ThemeType themeType,
  }) {
    return _localDataRepository.writeThemeType(
      themeType: themeType,
    );
  }

  Future<String> readThemeType() async {
    return _localDataRepository.readThemeType();
  }

  Future<void> writeLocale({
    required Locale locale,
  }) {
    return _localDataRepository.writeLocale(
      locale: locale,
    );
  }

  Future<String> readLocale() async {
    return _localDataRepository.readLocale();
  }
}
