import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

class InformationList extends StatelessWidget {
  final List<InformationItem> items;

  const InformationList({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.theme.borderColor,
        ),
        for (final item in items)
          _InformationItem(
            item: item,
          ),
      ],
    );
  }
}

class _InformationItem extends StatelessWidget {
  final InformationItem item;

  const _InformationItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.medium,
      ),
      child: Row(
        children: [
          Text(
            item.title,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.secondaryTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          ),
          const Spacer(),
          Text(
            item.description,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.primaryTextColor,
              fontWeight: AppFonts.weightSemiBold,
            ),
          )
        ],
      ),
    );
  }
}

class InformationItem {
  final String title;
  final String description;

  const InformationItem({
    required this.title,
    required this.description,
  });
}
