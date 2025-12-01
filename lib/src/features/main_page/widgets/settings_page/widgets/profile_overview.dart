import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

class ProfileOverview extends StatelessWidget {
  final VoidCallback onEditTap;
  final ProfileModel profileModel;

  const ProfileOverview({
    required this.onEditTap,
    required this.profileModel,
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
            backgroundImage: NetworkImage(
              profileModel.avatarUrl ??
                  'https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png',
            ),
          ),
          const SizedBox(width: AppDimensions.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileModel.fullName ?? '',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.profileNameColor,
                ),
              ),
              Text(
                profileModel.email ?? '',
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontSize: AppFonts.sizeTitleMedium,
                  color: context.theme.profileEmailColor,
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
              color: context.theme.whiteIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
