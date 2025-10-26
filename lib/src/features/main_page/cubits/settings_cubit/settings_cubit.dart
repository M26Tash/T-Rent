import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AuthInteractor _authInteractor;
  SettingsCubit(
    this._authInteractor,
  ) : super(
          const SettingsState(
            route: CustomizedRoute(
              null,
              null,
            ),
            isDarkThemeEnabled: false,
            isNotificationEnabled: false,
          ),
        );

  Future<void> signOut() {
    return _authInteractor.signOut();
  }

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
