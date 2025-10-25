import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            route: CustomizedRoute(
              null,
              null,
            ),
            isDarkThemeEnabled: false,
            isNotificationEnabled: false,
          ),
        );

  void toggleThemeSwitcher({
    required bool value,
  }) {
    emit(
      state.copyWith(
        isDarkThemeEnabled: value,
      ),
    );
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
