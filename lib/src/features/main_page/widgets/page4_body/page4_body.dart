import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';

class Page4Body extends StatelessWidget {
  const Page4Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        children: const [
          Text('PAGE 4'),
        ],
      ),
    );
  }
}
