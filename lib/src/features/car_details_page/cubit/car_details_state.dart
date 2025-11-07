part of 'car_details_cubit.dart';

class CarDetailsState extends Equatable {
  final CustomizedRoute route;
  final RentalPlan? rentalPlan;
  final DateTimeRange<DateTime>? rangePicked;
  final double totalPrice;

  @override
  List<Object?> get props => [
        route,
        rentalPlan,
        rangePicked,
        totalPrice,
      ];

  const CarDetailsState({
    required this.route,
    required this.rentalPlan,
    required this.rangePicked,
    required this.totalPrice,
  });

  CarDetailsState copyWith({
    CustomizedRoute? route,
    RentalPlan? rentalPlan,
    DateTimeRange<DateTime>? rangePicked,
    double? totalPrice,
  }) {
    return CarDetailsState(
      route: route ?? this.route,
      rentalPlan: rentalPlan ?? this.rentalPlan,
      rangePicked: rangePicked ?? this.rangePicked,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
