import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final ValueChanged<int> onTap;
  final bool isScrollable;
  final TabAlignment? tabAlignment;

  const CustomTabBar({
    required this.tabs,
    required this.onTap,
    this.isScrollable = true,
    this.tabAlignment = TabAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.surfaceColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.preLarge,
          ),
        ),
      ),
      child: TabBar(
        isScrollable: isScrollable,
        tabAlignment: tabAlignment,
        dividerColor: context.theme.transparent,
        indicator: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.preLarge,
            ),
          ),
        ),
        indicatorAnimation: TabIndicatorAnimation.elastic,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: context.themeData.textTheme.headlineMedium?.copyWith(
          color: context.theme.activeTabTextColor,
        ),
        unselectedLabelStyle:
            context.themeData.textTheme.headlineSmall?.copyWith(
          color: context.theme.inActiveTabTextColor,
          fontWeight: AppFonts.weightMedium,
        ),
        tabs: tabs,
        onTap: onTap,
      ),
    );
  }
}
