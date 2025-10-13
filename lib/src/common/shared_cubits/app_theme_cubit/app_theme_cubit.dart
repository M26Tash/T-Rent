import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit()
      : super(
          const AppThemeState(
            themeType: ThemeType.light,
          ),
        );

  ThemeType get themeType => state.themeType;
}
