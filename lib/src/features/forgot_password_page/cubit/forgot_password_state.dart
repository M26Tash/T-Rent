part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final CustomizedRoute route;
  final int currentPageIndex;
  final String? email;
  final String? password;

  @override
  List<Object?> get props => [
        route,
        currentPageIndex,
        email,
        password,
      ];

  const ForgotPasswordState({
    required this.route,
    required this.currentPageIndex,
    required this.email,
    required this.password,
  });

  ForgotPasswordState copyWith({
    CustomizedRoute? route,
    int? currentPageIndex,
    String? email,
    String? password,
  }) {
    return ForgotPasswordState(
      route: route ?? this.route,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      email: email,
      password: password,
    );
  }
}
