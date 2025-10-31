import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/widgets/car_item/car_item.dart';
import 'package:t_rent/src/common/widgets/custom_tab_bar/custom_tab_bar.dart';
import 'package:t_rent/src/common/widgets/input_field/input_field.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/features/main_page/widgets/home_page/widgets/filter_bottom_sheet_child.dart';

class HomeBody extends StatelessWidget {
  final ProfileModel profile;
  final List<CarModel> cars;
  final ValueChanged<int> onTabTap;
  final ValueChanged<int> onSortOrderTabTap;
  final ValueChanged<int> onFilterTabTap;
  final ValueChanged<String> onSearchChanged;
  final String userAddress;

  const HomeBody({
    required this.profile,
    required this.cars,
    required this.onTabTap,
    required this.onSortOrderTabTap,
    required this.onFilterTabTap,
    required this.onSearchChanged,
    required this.userAddress,
    super.key,
  });

  Future<void> filterBottomSheet({
    required BuildContext context,
    required Widget child,
  }) async {
    await SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: 'Filter',
      useRootNavigator: true,
      useCloseButton: false,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: context.theme.surfaceColor,
              radius: AppDimensions.smallAvatarRadius,
              backgroundImage: NetworkImage(
                profile.avatarUrl ??
                    'https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png',
              ),
            ),
            const SizedBox(width: AppDimensions.large),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.fullName ?? '',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                    ),
                  ),
                  Text(
                    userAddress,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.primaryTextColor,
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
          suffixIcon: VectorButton(
            onTap: () => filterBottomSheet(
              context: context,
              child: FilterBottomSheetChild(
                onSortOrderTap: onSortOrderTabTap,
                onFilterTap: onFilterTabTap,
              ),
            ),
            svgAssetPath: AppAssets.filterIcon,
          ),
          hintText: context.locale.search,
          onChanged: onSearchChanged,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomTabBar(
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
        const SizedBox(height: AppDimensions.extraLarge),
        for (final car in cars)
          CarItem(
            onCarTap: () =>
                context.read<NavigationPanelCubit>().navigateToCarDetails(
                      car: car,
                    ),
            car: car,
            asset: car.carImage.sideView,
          ),
      ],
    );
  }
}
