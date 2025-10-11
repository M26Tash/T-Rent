import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';

class TestBody extends StatelessWidget {
  const TestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
    );
  }
}
