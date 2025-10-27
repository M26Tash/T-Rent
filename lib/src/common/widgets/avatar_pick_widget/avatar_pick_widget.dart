import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class AvatarPickWidget extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onEditTap;
  const AvatarPickWidget({
    required this.onEditTap,
    this.avatarUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: context.theme.surfaceColor,
          radius: AppDimensions.avatarPickRadius,
          backgroundImage: NetworkImage(avatarUrl ?? ''),
          onBackgroundImageError: (error, stackTrace) {
            debugPrint('Avatar load error: $error');
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.small(
              backgroundColor: context.theme.primaryColor,
              shape: const CircleBorder(),
              elevation: AppDimensions.none,
              onPressed: onEditTap,
              child: VectorImage(
                svgAssetPath: AppAssets.editIcon,
                color: context.theme.tertiaryIconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
