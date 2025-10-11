import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';

part 'app_state.dart';

const _defaultLocale = Locale('en');

class AppCubit extends Cubit<AppState> {
  final AppThemeCubit _appThemeCubit;
  final AppLocaleCubit _appLocaleCubit;
  AppCubit(
    this._appThemeCubit,
    this._appLocaleCubit,
  ) : super(
          AppState(
            themeType: _appThemeCubit.state.themeType,
            locale: _defaultLocale,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<AppThemeState>? _themeStateSubscription;
  StreamSubscription<AppLocaleState>? _appLocaleStateSubscription;

  @override
  Future<void> close() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = null;

    _appLocaleStateSubscription?.cancel();
    _appLocaleStateSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _themeStateSubscription?.cancel();
    _themeStateSubscription = _appThemeCubit.stream.listen(
      (event) => _onNewThemeState(
        event.themeType,
      ),
    );

    _appLocaleStateSubscription?.cancel();
    _appLocaleStateSubscription = _appLocaleCubit.stream.listen(
      (event) => _onNewAppLocaleState(
        event.locale,
      ),
    );
  }

  void _onNewThemeState(ThemeType themeType) {
    emit(
      state.copyWith(
        themeType: themeType,
      ),
    );
  }

  void _onNewAppLocaleState(Locale? locale) {
    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }
}
