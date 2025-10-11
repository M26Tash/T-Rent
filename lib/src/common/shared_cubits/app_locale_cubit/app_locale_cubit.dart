import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_locale_state.dart';

const _defaultLocale = Locale('en');

class AppLocaleCubit extends Cubit<AppLocaleState> {
  AppLocaleCubit()
      : super(
          const AppLocaleState(
            locale: _defaultLocale,
          ),
        );
}
