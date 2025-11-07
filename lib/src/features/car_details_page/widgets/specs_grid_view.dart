import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class SpecsGridView extends StatelessWidget {
  final List<SpecsItem> specs;

  const SpecsGridView({
    required this.specs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.specsListHeight,
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final spec in specs)
            _SpecsItem(
              asset: spec.asset,
              specsTitle: spec.specsTitle,
              specsDetail: spec.specsDetail,
            ),
        ],
      ),
    );
  }
}

class _SpecsItem extends StatelessWidget {
  final String asset;
  final String specsTitle;
  final String specsDetail;

  const _SpecsItem({
    required this.asset,
    required this.specsTitle,
    required this.specsDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.preLarge,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VectorImage(
            svgAssetPath: asset,
            color: context.theme.tertiaryIconColor,
          ),
          Flexible(
            child: Text(
              specsDetail,
              style: context.themeData.textTheme.displaySmall?.copyWith(
                color: context.theme.tertiaryTextColor,
                fontWeight: AppFonts.weightBold,
              ),
              softWrap: true,
            ),
          ),
          Flexible(
            child: Text(
              specsTitle,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontSize: AppFonts.sizeTitleMedium,
                color: context.theme.tertiaryTextColor,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

final class SpecsItem {
  final String asset;
  final String specsTitle;
  final String specsDetail;

  const SpecsItem({
    required this.asset,
    required this.specsTitle,
    required this.specsDetail,
  });
}
