part of 'route_cubit.dart';

class RouteState extends Equatable {
  final CustomizedRoute route;
  final List<CarModel>? cars;

  @override
  List<Object?> get props => [
        route,
        cars,
      ];

  const RouteState({
    required this.route,
    required this.cars,
  });

  RouteState copyWith({
    CustomizedRoute? route,
     List<CarModel>? cars,
  }) {
    return RouteState(
      route: route ?? this.route,
      cars: cars ?? this.cars,
    );
  }
}
