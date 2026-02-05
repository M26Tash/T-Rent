import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/car_item/car_item.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

class ConfirmationBody extends StatelessWidget {
  // final CarModel car;

  const ConfirmationBody({
    // required this.car,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimensions.large),
          margin: const EdgeInsets.only(bottom: AppDimensions.large),
          height: context.availableHeight * 0.27,
          width: context.availableWidth,
          decoration: BoxDecoration(
            color: context.theme.surfaceColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.large,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: context.theme.accentColor,
                blurRadius: 6,
                offset: Offset(1, 1),
                spreadRadius: .2,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$340 x 4 days'),
                  Text('SUV'),
                ],
              ),
              Image.asset(
                AppAssets.audiQ7Side,
                fit: BoxFit.cover,
                width: context.availableWidth,
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Audi Q7'),
                    Text('4.8 ★'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
