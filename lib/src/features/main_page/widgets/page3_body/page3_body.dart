import 'package:flutter/widgets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';

class Page3Body extends StatelessWidget {
  const Page3Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        children: const [
          Text('PAGE 3'),
        ],
      ),
    );
  }
}
