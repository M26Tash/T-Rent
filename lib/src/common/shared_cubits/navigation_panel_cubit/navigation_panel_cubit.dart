import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
            route: CustomizedRoute(null, null),
          ),
        );

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    if (state.navigationIndex == navigationIndex) return;

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
      ),
    );
  }

  void navigateToMyAccount() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          MyAccountRoute(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToHelp() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          HelpRoute(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToCarDetails({
    required MockCar mockCar,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          CarDetailsRoute(
            mockCar: mockCar,
          ),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToAboutUs() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          AboutUsRoute(),
        ),
      ),
    );

    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
