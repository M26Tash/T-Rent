import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/utils/enums/filter_tab.dart';
import 'package:t_rent/src/common/utils/enums/sort_order.dart';
import 'package:t_rent/src/common/utils/extensions/list_extension.dart';
import 'package:t_rent/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';

class FilterBottomSheetChild extends StatelessWidget {
  final ValueChanged<int> onSortOrderTap;
  final ValueChanged<int> onFilterTap;

  const FilterBottomSheetChild({
    required this.onSortOrderTap,
    required this.onFilterTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DefaultTabController(
          length: SortOrder.values.length,
          child: CustomTabBar(
            tabAlignment: TabAlignment.center,
            tabs: SortOrder.values.map((tab) {
              return Tab(
                text: tab.displayName(
                  context,
                ),
              );
            }).toList(),
            onTap: onSortOrderTap,
          ),
        ),
        DefaultTabController(
          length: FilterTab.values.length,
          child: CustomTabBar(
            tabAlignment: TabAlignment.center,
            tabs: FilterTab.values.map((tab) {
              return Tab(
                text: tab.displayName(
                  context,
                ),
              );
            }).toList(),
            onTap: onFilterTap,
          ),
        ),
      ].insertBetween(
        const SizedBox(
          height: AppDimensions.large,
        ),
      ),
    );
  }
}
