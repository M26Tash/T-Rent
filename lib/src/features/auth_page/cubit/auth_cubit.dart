import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthInteractor _authInteractor;
  AuthCubit(
    this._authInteractor,
  ) : super(
          const AuthState(
            route: CustomizedRoute(
              null,
              null,
            ),
            currentSession: null,
            signInExceptionMessage: null,
            registerInExceptionMessage: null,
            showLogin: true,
            isObscure: true,
            userFullName: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<String?>? _signInExceptionMessageSubscription;
  StreamSubscription<String?>? _registerExceptionMessageSubscription;
  StreamSubscription<Session?>? _sessionSubscription;

  @override
  Future<void> close() {
    _signInExceptionMessageSubscription?.cancel();
    _signInExceptionMessageSubscription = null;

    _registerExceptionMessageSubscription?.cancel();
    _registerExceptionMessageSubscription = null;

    _sessionSubscription?.cancel();
    _sessionSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _signInExceptionMessageSubscription?.cancel();
    _signInExceptionMessageSubscription =
        _authInteractor.signInExceptionMessageStream.listen(
      _onNewSignInExceptionMessage,
    );

    _registerExceptionMessageSubscription?.cancel();
    _registerExceptionMessageSubscription =
        _authInteractor.registerExceptionMessageStream.listen(
      _onNewRegisterExceptionMessage,
    );

    _sessionSubscription?.cancel();
    _sessionSubscription = _authInteractor.sessionStream.listen(
      _onNewSession,
    );
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) {
    return _authInteractor.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> registerWithPassword({
    required String email,
    required String password,
  }) {
    return _authInteractor.registerWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _authInteractor.signOut();
  }

  void updateFullName({required String fullName}) {
    emit(
      state.copyWith(
        userFullName: fullName,
      ),
    );
  }

  void _onNewSignInExceptionMessage(String? message) {
    emit(
      state.copyWith(
        signInExceptionMessage: message,
      ),
    );
  }

  void _onNewRegisterExceptionMessage(String? message) {
    emit(
      state.copyWith(
        registerInExceptionMessage: message,
      ),
    );
  }

  void _onNewSession(Session? session) {
    emit(
      state.copyWith(
        currentSession: session,
      ),
    );

    if (session != null && state.userFullName != null) {
      _navigateToUserDetails(
        email: session.user.email ?? '',
        fullName: state.userFullName ?? 'NOT FOUND',
      );
    }
  }

  void toggleAuthStep() {
    final showLogin = !state.showLogin;

    emit(
      state.copyWith(
        showLogin: showLogin,
      ),
    );
  }

  void toggleObscure() {
    final isObscure = !state.isObscure;

    emit(
      state.copyWith(
        isObscure: isObscure,
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

  void _navigateToUserDetails({
    required String email,
    required String fullName,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          UserDetailsRoute(
            email: email,
            fullName: fullName,
          ),
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
