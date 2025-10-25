// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class SpecsItem extends StatelessWidget {
  final String asset;
  final String specsTitle;
  final String specsDetail;

  const SpecsItem({
    required this.asset,
    required this.specsTitle,
    required this.specsDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: AppDimensions.large),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.extraLarge,
        vertical: AppDimensions.large,
      ),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.preLarge,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.accentColor.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VectorImage(
            svgAssetPath: asset,
            color: context.theme.tertiaryIconColor,
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            specsDetail,
            style: context.themeData.textTheme.displayMedium?.copyWith(
              color: context.theme.tertiaryTextColor,
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          Text(
            specsTitle,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.tertiaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
