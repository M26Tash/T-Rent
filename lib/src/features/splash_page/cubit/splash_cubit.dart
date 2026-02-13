
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(
          const SplashState(
            route: CustomizedRoute(
              null,
              null,
            ),
          ),
        );

  void navigateToAuth() {
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
}
