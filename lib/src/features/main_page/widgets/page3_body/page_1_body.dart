import 'package:flutter/widgets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';

class Page1Body extends StatelessWidget {
  const Page1Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: const [
        Text('PAGE 1'),
      ],
    );
  }
}
