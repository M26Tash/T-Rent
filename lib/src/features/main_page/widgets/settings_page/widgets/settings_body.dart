import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/settings_section/settings_section.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/widgets/profile_overview.dart';

class SettingsBody extends StatelessWidget {
  final ValueChanged<bool> onThemeSwitchChanged;
  final ValueChanged<bool> onNotificationSwitchChanged;
  final bool isDarkThemeEnabled;
  final bool isNotificationEnabled;

  const SettingsBody({
    required this.onThemeSwitchChanged,
    required this.onNotificationSwitchChanged,
    required this.isDarkThemeEnabled,
    required this.isNotificationEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        ProfileOverview(
          onEditTap: () {},
          fullName: 'John Due',
          email: 'john.due@gmail.com',
          avatarUrl: AppAssets.userPlaceholder,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        SettingsSection(
          sectionTitle: context.locale.preferences,
          settingsItems: [
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.userIcon,
              title: context.locale.myAccount,
              subtitle: context.locale.makeChangesToYourAccount,
            ),
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
              onTap: () {},
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
              onTap: () {},
              assetPath: AppAssets.helpIcon,
              title: context.locale.help,
            ),
            SettingsItem(
              onTap: () {},
              assetPath: AppAssets.aboutUsIcon,
              title: context.locale.aboutUs,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        SettingsSection(
          settingsItems: [
            SettingsItem(
              onTap: () {},
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
