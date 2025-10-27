import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/common/utils/convertors/theme_type_convertor.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthInteractor _authInteractor;
  final AppThemeCubit _appThemeCubit;
  final AppLocaleCubit _appLocaleCubit;
  final DataInteractor _dataInteractor;

  SettingsCubit(
    this._authInteractor,
    this._appThemeCubit,
    this._appLocaleCubit,
    this._dataInteractor,
  ) : super(
          SettingsState(
            route: const CustomizedRoute(
              null,
              null,
            ),
            profile: null,
            isDarkThemeEnabled: ThemeTypeConvertor.toBool(
              _appThemeCubit.state.themeType,
            ),
            isNotificationEnabled: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<AppThemeState>? _appThemeStateSubscription;
  StreamSubscription<ProfileModel?>? _profileSubscription;

  @override
  Future<void> close() {
    _appThemeStateSubscription?.cancel();
    _appThemeStateSubscription = null;

    _profileSubscription?.cancel();
    _profileSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _appThemeStateSubscription?.cancel();
    _appThemeStateSubscription = _appThemeCubit.stream.listen(
      (event) => _onNewThemeState(
        event.themeType,
      ),
    );

    _profileSubscription?.cancel();
    _profileSubscription = _dataInteractor.profileStream.listen(
      _onNewProfile,
    );
  }

  Future<void> getProfile() async {
    return _dataInteractor.getProfile();
  }

  void _onNewProfile(ProfileModel? profile) {
    emit(
      state.copyWith(
        profile: profile,
      ),
    );
  }

  void _onNewThemeState(ThemeType themeType) {
    emit(
      state.copyWith(
        isDarkThemeEnabled: ThemeTypeConvertor.toBool(themeType),
      ),
    );
  }

  void updateLocale(String locale) {
    _appLocaleCubit.setLocale(
      Locale(
        locale,
      ),
    );
  }

  void toggleThemeSwitcher({required bool value}) {
    final newTheme = ThemeTypeConvertor.fromBool(value: value);
    _appThemeCubit.setThemeType(newTheme);

    emit(
      state.copyWith(
        isDarkThemeEnabled: value,
      ),
    );
  }

  Future<void> signOut() {
    return _authInteractor.signOut();
  }

  void toggleNotificationSwitcher({
    required bool value,
  }) {
    emit(
      state.copyWith(
        isNotificationEnabled: value,
      ),
    );
  }

  // ignore: unused_element
  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
