part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final CustomizedRoute route;
  final bool showLogin;

  @override
  List<Object?> get props => [
        route,
        showLogin,
      ];

  const AuthState({
    required this.route,
    required this.showLogin,
  });

  AuthState copyWith({
    CustomizedRoute? route,
    bool? showLogin,
  }) {
    return AuthState(
      route: route ?? this.route,
      showLogin: showLogin ?? this.showLogin,
    );
  }
}
