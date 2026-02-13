part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final CustomizedRoute route;
  final Session? currentSession;

  @override
  List<Object?> get props => [
        navigationIndex,
        route,
        currentSession,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.route,
    required this.currentSession,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    CustomizedRoute? route,
    Session? currentSession,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      route: route ?? this.route,
      currentSession: currentSession ?? this.currentSession,
    );
  }
}
