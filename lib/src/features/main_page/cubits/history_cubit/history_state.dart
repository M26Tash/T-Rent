part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const HistoryState({
    required this.route,

  });

  HistoryState copyWith({
    CustomizedRoute? route,
  }) {
    return HistoryState(
      route: route ?? this.route,
    );
  }
}
