import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/utils/convertors/theme_type_convertor.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/core/domain/interactors/local_data_interactor.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final LocalDataInteractor _localDataInteractor;
  AppThemeCubit(
    this._localDataInteractor,
  )
      : super(
          const AppThemeState(
            themeType: ThemeType.light,
          ),
        );

  ThemeType get themeType => state.themeType;

  Future<void> readThemeType() async {
    final themeType = await _localDataInteractor.readThemeType();
    final convertedThemeType = ThemeTypeConvertor.fromText(themeType);
    emit(
      state.copyWith(
        themeType: convertedThemeType,
      ),
    );
  }

  Future<void> setThemeType(ThemeType themeType) async {
    await _localDataInteractor.writeThemeType(themeType: themeType);

    emit(
      state.copyWith(
        themeType: themeType,
      ),
    );
  }
}
