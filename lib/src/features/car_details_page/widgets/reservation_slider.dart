import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

class ReservationSlider extends StatelessWidget {
  final VoidCallback onSubmit;

  const ReservationSlider({
    required this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      height: AppDimensions.sliderHeight,
      child: SlideAction(
        animationDuration: const Duration(milliseconds: 400),
        outerColor: context.theme.primaryColor,
        text: context.locale.slideToContinue,
        onSubmit: () async => onSubmit(),
      ),
    );
  }
}
