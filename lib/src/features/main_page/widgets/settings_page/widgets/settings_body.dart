import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/localization/flutter_gen/app_localizations.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/list_extension.dart';
import 'package:t_rent/src/common/widgets/settings_section/settings_section.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/widgets/language_item.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/widgets/profile_overview.dart';

class SettingsBody extends StatelessWidget {
  final VoidCallback onSignOutTap;
  final ValueChanged<bool> onThemeSwitchChanged;
  final ValueChanged<bool> onNotificationSwitchChanged;
  final ValueChanged<String> onLanguageChanged;
  final bool isDarkThemeEnabled;
  final bool isNotificationEnabled;

  const SettingsBody({
    required this.onSignOutTap,
    required this.onThemeSwitchChanged,
    required this.onNotificationSwitchChanged,
    required this.onLanguageChanged,
    required this.isDarkThemeEnabled,
    required this.isNotificationEnabled,
    super.key,
  });

  Future<void> languageBottomSheet({
    required BuildContext context,
    required String currentLocale,
    required ValueChanged<String> onValueChanged,
  }) async {
    await SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: context.locale.language,
      useRootNavigator: true,
      child: Column(
        children: <Widget>[
          for (final language in AppLocalization.supportedLocales)
            LanguageItem(
              languageCode: language.languageCode,
              currentLocale: currentLocale,
              onValueChanged: onValueChanged,
            ),
        ].insertBetween(
          const SizedBox(
            height: AppDimensions.large,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        ProfileOverview(
          onEditTap: () =>
              context.read<NavigationPanelCubit>().navigateToMyAccount(),
          fullName: 'John Due',
          email: 'john.due@gmail.com',
          avatarUrl: AppAssets.userPlaceholder,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        SettingsSection(
          sectionTitle: context.locale.preferences,
          settingsItems: [
            SettingsItem(
              assetPath: AppAssets.notificationIcon,
              title: context.locale.notification,
              subtitle: context.locale.manageYourAlertsAndUpdates,
              suffix: CupertinoSwitch(
                activeTrackColor: context.theme.primaryColor,
                value: isNotificationEnabled,
                onChanged: onNotificationSwitchChanged,
              ),
            ),
            SettingsItem(
              onTap: () => languageBottomSheet(
                context: context,
                currentLocale: context.locale.localeName,
                onValueChanged: onLanguageChanged,
              ),
              assetPath: AppAssets.languageIcon,
              title: context.locale.language,
              subtitle: context.locale.setYourPreferredAppLanguage,
            ),
            SettingsItem(
              assetPath: AppAssets.brushIcon,
              title: context.locale.appearance,
              subtitle: context.locale.lightOrDarkYourChoice,
              suffix: CupertinoSwitch(
                thumbIcon: WidgetStatePropertyAll(
                  isDarkThemeEnabled == true
                      ? const Icon(
                          Icons.dark_mode_rounded,
                        )
                      : const Icon(
                          Icons.light_mode_rounded,
                        ),
                ),
                activeTrackColor: context.theme.primaryColor,
                value: isDarkThemeEnabled,
                onChanged: onThemeSwitchChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        SettingsSection(
          sectionTitle: context.locale.support,
          settingsItems: [
            SettingsItem(
              onTap: () =>
                  context.read<NavigationPanelCubit>().navigateToHelp(),
              assetPath: AppAssets.helpIcon,
              title: context.locale.help,
            ),
            SettingsItem(
              onTap: () =>
                  context.read<NavigationPanelCubit>().navigateToAboutUs(),
              assetPath: AppAssets.aboutUsIcon,
              title: context.locale.aboutUs,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        SettingsSection(
          settingsItems: [
            SettingsItem(
              onTap: onSignOutTap,
              assetPath: AppAssets.logoutIcon,
              title: context.locale.logOut,
              subtitle: context.locale.furtherSecureYourAccountForSafety,
            ),
          ],
        ),
      ],
    );
  }
}
