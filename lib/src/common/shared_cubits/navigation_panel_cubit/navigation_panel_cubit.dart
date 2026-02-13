import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';

import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  final AuthInteractor _authInteractor;
  NavigationPanelCubit(
    this._authInteractor,
  ) : super(
          const NavigationPanelState(
            navigationIndex: 0,
            route: CustomizedRoute(
              null,
              null,
            ),
            currentSession: null,
          ),
        ) {
    _subscribeAll();
  }
  StreamSubscription<Session?>? _sessionSubscription;

  @override
  Future<void> close() {
    _sessionSubscription?.cancel();
    _sessionSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _sessionSubscription?.cancel();
    _sessionSubscription = _authInteractor.sessionStream.listen(
      _onNewSession,
    );
  }

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    if (state.navigationIndex == navigationIndex) return;

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
      ),
    );
  }

  void navigateToAuthPage() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          AuthRoute(),
          shouldClearStack: true,
        ),
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
    required CarModel car,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          CarDetailsRoute(
            car: car,
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

  void _onNewSession(Session? session) {
    emit(
      state.copyWith(
        currentSession: session,
      ),
    );
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
