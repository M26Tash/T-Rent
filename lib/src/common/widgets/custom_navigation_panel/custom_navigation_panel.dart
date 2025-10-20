import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class CustomNavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final List<CustomNavigationItem> items;
  final ValueChanged<int>? onIndexChanged;

  const CustomNavigationPanel({
    required this.selectedIndex,
    required this.items,
    required this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.superLarge,
        vertical: AppDimensions.large,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.large,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var index = 0; index < items.length; index++)
            _CustomNavigationItem(
              itemIndex: index,
              selectedIndex: selectedIndex,
              navigationItem: items[index],
              onIndexChanged: onIndexChanged,
            ),
        ],
      ),
    );
  }
}

final class _CustomNavigationItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final CustomNavigationItem navigationItem;
  final ValueChanged<int>? onIndexChanged;

  const _CustomNavigationItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.navigationItem,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIconScale = 1.2;
    const unselectedIconScale = 1.0;

    final activeColor = context.theme.tertiaryIconColor;
    final inactiveColor = context.theme.secondaryIconColor;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onIndexChanged?.call(itemIndex),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Column(
          children: [
            AnimatedScale(
              scale: itemIndex == selectedIndex
                  ? selectedIconScale
                  : unselectedIconScale,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              child: VectorImage(
                width: AppDimensions.panelNavigationIconSize,
                height: AppDimensions.panelNavigationIconSize,
                svgAssetPath: navigationItem.iconPath,
                color: itemIndex == selectedIndex ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class CustomNavigationItem {
  final String iconPath;

  const CustomNavigationItem({
    required this.iconPath,
  });
}
