import 'package:flutter/widgets.dart';
import 'package:t_rent/src/features/main_page/widgets/history_page/history_page.dart';
import 'package:t_rent/src/features/main_page/widgets/home_page/home_page.dart';
import 'package:t_rent/src/features/main_page/widgets/route_page/route_page.dart';
import 'package:t_rent/src/features/main_page/widgets/settings_page/settings_page.dart';

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
        HistoryPage(),
        RoutePage(),
        SettingsPage(),
      ],
    );
  }
}
