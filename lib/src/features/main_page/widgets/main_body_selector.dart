import 'package:flutter/widgets.dart';
import 'package:t_rent/src/features/main_page/widgets/home_page/home_page.dart';
import 'package:t_rent/src/features/main_page/widgets/page2_body/page2_body.dart';
import 'package:t_rent/src/features/main_page/widgets/page4_body/page4_body.dart';
import 'package:t_rent/src/features/main_page/widgets/route_page/route_page.dart';

class MainBodySelector extends StatelessWidget {
  final PageController pageController;

  const MainBodySelector({
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        Page2Body(),
        RoutePage(),
        Page4Body(),
      ],
    );
  }
}
