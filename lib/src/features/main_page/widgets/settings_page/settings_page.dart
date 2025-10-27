import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/features/main_page/cubits/settings_cubit/settings_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/widgets/settings_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<SettingsCubit>(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final settingsCubit = CubitScope.of<SettingsCubit>(context);
          return SafeArea(
            child: SettingsBody(
              onSignOutTap: settingsCubit.signOut,
              onThemeSwitchChanged: (value) =>
                  settingsCubit.toggleThemeSwitcher(value: value),
              onNotificationSwitchChanged: (value) =>
                  settingsCubit.toggleNotificationSwitcher(
                value: value,
              ),
              onLanguageChanged: settingsCubit.updateLocale,
              isDarkThemeEnabled: state.isDarkThemeEnabled,
              isNotificationEnabled: state.isNotificationEnabled,
            ),
          );
        },
      ),
    );
  }
}
