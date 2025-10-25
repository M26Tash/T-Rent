part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final CustomizedRoute route;
  
  @override
  List<Object?> get props => [
        navigationIndex,
        route,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.route,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    CustomizedRoute? route,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      route: route ?? this.route,
    );
  }
}
