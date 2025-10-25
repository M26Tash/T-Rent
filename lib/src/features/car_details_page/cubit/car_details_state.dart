part of 'car_details_cubit.dart';

class CarDetailsState extends Equatable {
  final CustomizedRoute route;
  final RentalPlan? rentalPlan;

  @override
  List<Object?> get props => [
        route,
        rentalPlan,
      ];

  const CarDetailsState({
    required this.route,
    required this.rentalPlan,
  });

  CarDetailsState copyWith({
    CustomizedRoute? route,
    RentalPlan? rentalPlan,
  }) {
    return CarDetailsState(
      route: route ?? this.route,
      rentalPlan: rentalPlan ?? this.rentalPlan,
    );
  }
}
