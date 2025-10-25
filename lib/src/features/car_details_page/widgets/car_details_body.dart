import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/features/car_details_page/widgets/rental_plan_item.dart';
import 'package:t_rent/src/features/car_details_page/widgets/specs_item.dart';

class CarDetailsBody extends StatefulWidget {
  final MockCar mockCar;
  final ValueChanged<RentalPlan?> onPlanChanged;
  final RentalPlan? currentRentalPlan;

  const CarDetailsBody({
    required this.mockCar,
    required this.onPlanChanged,
    required this.currentRentalPlan,
    super.key,
  });

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  void didUpdateWidget(CarDetailsBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentRentalPlan == null &&
        widget.currentRentalPlan != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brand',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    widget.mockCar.brand,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    'Model',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    widget.mockCar.model,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    'Year',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    widget.mockCar.carYear,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    'Price',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    '${widget.mockCar.rentalPlanRate.pricePerDay}₺ / Day',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: context.availableWidth * 0.6,
              child: Image.asset(
                widget.mockCar.assets.frontView,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          'Car Specifications',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
        ),
        const SizedBox(height: AppDimensions.medium),
        SizedBox(
          height: AppDimensions.specsListHeight,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              SpecsItem(
                asset: AppAssets.drivingIcon,
                specsTitle: 'Horsepowers',
                specsDetail: '689 HP',
              ),
              SpecsItem(
                asset: AppAssets.userIcon,
                specsTitle: 'Seats',
                specsDetail: '4',
              ),
              SpecsItem(
                asset: AppAssets.gasStationIcon,
                specsTitle: 'Per 100 km',
                specsDetail: '10.2 L',
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          'Rental Plan',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
        ),
        const SizedBox(height: AppDimensions.medium),
        for (int i = 0; i < RentalPlan.values.length; i++)
          RentalPlanItem(
            rentalPlanRate: widget.mockCar.rentalPlanRate,
            rentalPlan: RentalPlan.values[i],
            currentRentalPlan: widget.currentRentalPlan,
            onPlanChanged: widget.onPlanChanged,
          ),
        if (widget.currentRentalPlan != null)
          const SizedBox(height: AppDimensions.extremeLarge),
      ],
    );
  }
}
