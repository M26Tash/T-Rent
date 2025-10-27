import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/core/domain/interactors/local_data_interactor.dart';

part 'app_locale_state.dart';

const _defaultLocale = Locale('en');

class AppLocaleCubit extends Cubit<AppLocaleState> {
  final LocalDataInteractor _localDataInteractor;
  AppLocaleCubit(
    this._localDataInteractor,
  ) : super(
          const AppLocaleState(
            locale: _defaultLocale,
          ),
        );

  Future<void> readLocale() async {
    final locale = await _localDataInteractor.readLocale();

    emit(
      state.copyWith(
        locale: Locale(locale),
      ),
    );
  }

  Future<void> setLocale(Locale locale) async {
    await _localDataInteractor.writeLocale(locale: locale);

    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }
}
