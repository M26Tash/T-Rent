import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/common/widgets/custom_navigation_panel/custom_navigation_panel.dart';
import 'package:t_rent/src/features/main_page/widgets/main_body_selector.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final NavigationPanelCubit _navigationalPanelCubit =
      i.get<NavigationPanelCubit>();

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _navigationalPanelCubit.state.navigationIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  void _listener(BuildContext context, NavigationPanelState state) {
    // ignore: unnecessary_null_comparison
    if (state.navigationIndex != null) {
      _pageController.jumpToPage(state.navigationIndex);
    }

    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(
    NavigationPanelState prev,
    NavigationPanelState current,
  ) {
    return prev.navigationIndex != current.navigationIndex ||
        prev.route.type == null && current.route.type != null;
  }

  String? _appBarTitle(int pageIndex) => switch (pageIndex) {
        0 => null,
        1 => context.locale.history,
        2 => null,
        3 => context.locale.settings,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    return CubitScope<NavigationPanelCubit>(
      child: BlocConsumer<NavigationPanelCubit, NavigationPanelState>(
        bloc: _navigationalPanelCubit,
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final navCubit = CubitScope.of<NavigationPanelCubit>(context);
          return Scaffold(
            extendBody: true,
            backgroundColor: context.theme.backgroundColor,
            appBar: _appBarTitle(state.navigationIndex) == null
                ? null
                : CustomAppBar(
                    title: _appBarTitle(state.navigationIndex),
                  ),
            body: MainBodySelector(
              pageController: _pageController,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: CustomNavigationPanel(
              onIndexChanged: navCubit.updateNavigationIndex,
              selectedIndex: state.navigationIndex,
              items: const [
                CustomNavigationItem(
                  iconPath: AppAssets.homeIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.historyIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.routeIcon,
                ),
                CustomNavigationItem(
                  iconPath: AppAssets.settingsIcon,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
