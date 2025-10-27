part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final CustomizedRoute route;
  final Session? currentSession;
  final String? signInExceptionMessage;
  final String? registerInExceptionMessage;
  final bool showLogin;
  final bool isObscure;

  @override
  List<Object?> get props => [
        route,
        currentSession,
        signInExceptionMessage,
        registerInExceptionMessage,
        showLogin,
        isObscure,
      ];

  const AuthState({
    required this.route,
    required this.currentSession,
    required this.signInExceptionMessage,
    required this.registerInExceptionMessage,
    required this.showLogin,
    required this.isObscure,
  });

  AuthState copyWith({
    CustomizedRoute? route,
    Session? currentSession,
    String? signInExceptionMessage,
    String? registerInExceptionMessage,
    bool? showLogin,
    bool? isObscure,
  }) {
    return AuthState(
      route: route ?? this.route,
      currentSession: currentSession ?? this.currentSession,
      signInExceptionMessage:
          signInExceptionMessage ?? this.signInExceptionMessage,
      registerInExceptionMessage:
          registerInExceptionMessage ?? this.registerInExceptionMessage,
      showLogin: showLogin ?? this.showLogin,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
