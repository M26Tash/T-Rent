part of 'route_cubit.dart';

class RouteState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const RouteState({
    required this.route,

  });

  RouteState copyWith({
    CustomizedRoute? route,
  }) {
    return RouteState(
      route: route ?? this.route,
    );
  }
}
