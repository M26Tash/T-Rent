import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';

class TestBody extends StatelessWidget {
  final VoidCallback onTap;
  const TestBody({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.extremeLarge,
      ),
      children: [
        CustomButton(
          onTap: onTap,
          buttonText: 'TAP',
        ),
      ],
    );
  }
}
