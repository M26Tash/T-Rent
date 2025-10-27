import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/main_page/cubits/settings_cubit/settings_cubit.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/widgets/settings_body.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsCubit _settingsCubit = i.get<SettingsCubit>();

  @override
  void initState() {
    super.initState();

    _settingsCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<SettingsCubit>(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final settingsCubit = CubitScope.of<SettingsCubit>(context);

          if (state.profile == null) {
            return Center(
              child: CircularProgressIndicator(
                color: context.theme.primaryColor,
              ),
            );
          }

          return SafeArea(
            child: SettingsBody(
              profile: state.profile!,
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
