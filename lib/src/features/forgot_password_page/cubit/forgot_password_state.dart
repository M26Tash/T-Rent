part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  final CustomizedRoute route;
  final int currentPageIndex;
  @override
  List<Object?> get props => [
        route,
        currentPageIndex,
      ];

  const ForgotPasswordState({
    required this.route,
    required this.currentPageIndex,
  });

  ForgotPasswordState copyWith({
    CustomizedRoute? route,
    int? currentPageIndex

  }) {
    return ForgotPasswordState(
      route: route ?? this.route,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}
