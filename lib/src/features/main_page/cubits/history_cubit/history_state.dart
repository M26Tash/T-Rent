part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final CustomizedRoute route;
  final List<CarOrderModel>? carRentHistory;

  @override
  List<Object?> get props => [
        route,
        carRentHistory,
      ];

  const HistoryState({
    required this.route,
    required this.carRentHistory,
  });

  HistoryState copyWith({
    CustomizedRoute? route,
    List<CarOrderModel>? carRentHistory,
  }) {
    return HistoryState(
      route: route ?? this.route,
      carRentHistory: carRentHistory ?? this.carRentHistory,
    );
  }
}
