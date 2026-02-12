import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/date_time_extension.dart';
import 'package:t_rent/src/common/utils/formatter/currency_formatter.dart';
import 'package:t_rent/src/common/widgets/car_item/car_item.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/confirmation_page/widgets/information_list.dart';

class ConfirmationBody extends StatelessWidget {
  final CarModel car;
  final DateTime selectedStart;
  final DateTime selectedEnd;
  final double totalPrice;
  final VoidCallback onConfirm;

  const ConfirmationBody({
    required this.car,
    required this.selectedStart,
    required this.selectedEnd,
    required this.totalPrice,
    required this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        CarItem(
          onCarTap: () {},
          car: car,
          asset: car.carImage.sideView,
          header: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: CurrencyFormatter.format(car.carPricing.perDay),
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightBold,
                    ),
                  ),
                  TextSpan(
                    text: ' x ',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  TextSpan(
                    text: context.locale.days(
                      selectedEnd.difference(selectedStart).inDays,
                    ),
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: context.theme.accentColor,
                ),
                Text(
                  '${car.starReview}',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                ),
              ],
            ),
          ],
          footer: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: car.brand,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightBold,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: AppDimensions.medium,
                    ),
                  ),
                  TextSpan(
                    text: car.model,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          'Information',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
        ),
        InformationList(
          items: [
            InformationItem(
              title: 'Start Date',
              description: selectedStart.formatFullDate(),
            ),
            InformationItem(
              title: 'End Date',
              description: selectedEnd.formatFullDate(),
            ),
            InformationItem(
              title: 'Duration',
              description: context.locale.days(
                selectedEnd.difference(selectedStart).inDays,
              ),
            ),
          ],
        ),
        InformationList(
          items: [
            InformationItem(
              title: 'Deposit',
              description: CurrencyFormatter.format(car.carPricing.deposit),
            ),
            InformationItem(
              title: 'Total Amount',
              description: CurrencyFormatter.format(totalPrice),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimensions.large,
        ),
        SlideAction(
          animationDuration: const Duration(milliseconds: 400),
          outerColor: context.theme.primaryColor,
          onSubmit: () async => onConfirm(),
          text: 'Confirm',
        ),
      ],
    );
  }
}
