import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class SettingsSection extends StatelessWidget {
  final String? sectionTitle;
  final List<SettingsItem> settingsItems;

  const SettingsSection({
    required this.settingsItems,
    this.sectionTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (sectionTitle != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                sectionTitle!,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightSemiBold,
                ),
              ),
              const SizedBox(height: AppDimensions.medium),
            ],
          ),
        for (final item in settingsItems) _SettingsItem(settingsItem: item),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final SettingsItem settingsItem;
  const _SettingsItem({
    required this.settingsItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: settingsItem.onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: AppDimensions.medium,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.medium,
          vertical: AppDimensions.large,
        ),
        decoration: BoxDecoration(
          color: context.theme.surfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.large,
            ),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.theme.backgroundColor,
              child: VectorImage(
                svgAssetPath: settingsItem.assetPath,
                color: context.theme.primaryIconColor,
              ),
            ),
            const SizedBox(width: AppDimensions.medium),
            if (settingsItem.subtitle != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settingsItem.title,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightMedium,
                      ),
                    ),
                    Text(
                      settingsItem.subtitle!,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        fontSize: AppFonts.sizeTitleMedium,
                        color: context.theme.hintTextColor,
                        fontWeight: AppFonts.weightRegular,
                      ),
                    ),
                  ],
                ),
              ),
            if (settingsItem.subtitle == null)
              Text(
                settingsItem.title,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            if (settingsItem.subtitle == null) const Spacer(),
            if (settingsItem.suffix == null)
              VectorImage(
                svgAssetPath: AppAssets.arrowRightIcon,
                color: context.theme.primaryIconColor,
              ),
            if (settingsItem.suffix != null) settingsItem.suffix!,
          ],
        ),
      ),
    );
  }
}

final class SettingsItem {
  final VoidCallback? onTap;
  final String assetPath;
  final String title;
  final String? subtitle;
  final Widget? suffix;
  const SettingsItem({
    required this.assetPath,
    required this.title,
    this.onTap,
    this.subtitle,
    this.suffix,
  });
}
