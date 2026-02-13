part of 'car_details_cubit.dart';

class CarDetailsState extends Equatable {
  final CustomizedRoute route;
  final bool? isCarFavorite;

  @override
  List<Object?> get props => [
        route,
        isCarFavorite,
      ];

  const CarDetailsState({
    required this.route,
    required this.isCarFavorite,
  });

  CarDetailsState copyWith({
    CustomizedRoute? route,
    bool? isCarFavorite,
  }) {
    return CarDetailsState(
      route: route ?? this.route,
      isCarFavorite: isCarFavorite ?? this.isCarFavorite,
    );
  }
}
