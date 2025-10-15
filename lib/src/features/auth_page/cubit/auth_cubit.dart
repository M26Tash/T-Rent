import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            route: CustomizedRoute(
              null,
              null,
            ),
            showLogin: true,
          ),
        );

  void toggleAuthStep() {
    final showLogin = !state.showLogin;

    emit(
      state.copyWith(
        showLogin: showLogin,
      ),
    );
  }

  void navigateToForgotPassword() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          ForgotPasswordRoute(),
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
