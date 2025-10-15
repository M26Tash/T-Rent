import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

class CustomHorizontalStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CustomHorizontalStepper({
    required this.currentStep,
    super.key,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.preLarge,
              ),
              height: AppDimensions.stepperHeight,
              decoration: BoxDecoration(
                color: index <= currentStep
                    ? context.theme.primaryColor
                    : context.theme.surfaceColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    AppDimensions.small,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
