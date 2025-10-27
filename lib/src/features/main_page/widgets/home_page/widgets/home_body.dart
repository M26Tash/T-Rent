import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/car_item/car_item.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class HomeBody extends StatelessWidget {
  final List<MockCar> mockCarList;
  final ValueChanged<int> onTabTap;
  final ValueChanged<String> onSearchChanged;
  final String userAddress;

  const HomeBody({
    required this.mockCarList,
    required this.onTabTap,
    required this.onSearchChanged,
    required this.userAddress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: AppDimensions.smallAvatarRadius,
              backgroundImage: AssetImage(AppAssets.userPlaceholder),
            ),
            const SizedBox(width: AppDimensions.large),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Due',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                    ),
                  ),
                  Text(
                    userAddress,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppFonts.weightMedium,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            VectorButton(
              onTap: () {},
              svgAssetPath: AppAssets.notificationIcon,
            )
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          prefixIcon: const VectorImage(
            svgAssetPath: AppAssets.searchIcon,
          ),
          hintText: context.locale.search,
          onChanged: onSearchChanged,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        Container(
          decoration: BoxDecoration(
            color: context.theme.surfaceColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.preLarge,
              ),
            ),
          ),
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
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
              color: context.theme.tertiaryTextColor,
            ),
            unselectedLabelStyle:
                context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.accentTextColor,
              fontWeight: AppFonts.weightMedium,
            ),
            tabs: CarType.values
                .map(
                  (type) => Tab(
                    text: type.displayName(
                      context,
                    ),
                  ),
                )
                .toList(),
            onTap: onTabTap,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        for (final car in mockCarList)
          CarItem(
            onCarTap: () =>
                context.read<NavigationPanelCubit>().navigateToCarDetails(
                      mockCar: car,
                    ),
            mockCar: car,
          ),
      ],
    );
  }
}
