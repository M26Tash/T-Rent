import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class ProfileOverview extends StatelessWidget {
  final VoidCallback onEditTap;
  final String? fullName;
  final String? email;
  final String? avatarUrl;
  const ProfileOverview({
    required this.onEditTap,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: context.theme.surfaceColor,
            backgroundImage: AssetImage(avatarUrl!),
          ),
          const SizedBox(width: AppDimensions.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName ?? '',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.tertiaryTextColor,
                ),
              ),
              Text(
                email ?? '',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontSize: AppFonts.sizeTitleMedium,
                  color: context.theme.tertiaryIconColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            backgroundColor: context.theme.primaryColor,
            elevation: AppDimensions.none,
            shape: const CircleBorder(),
            onPressed: onEditTap,
            child: VectorImage(
              svgAssetPath: AppAssets.editIcon,
              color: context.theme.tertiaryIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
