part of 'car_details_cubit.dart';

class CarDetailsState extends Equatable {
  final CustomizedRoute route;
  final RentalPlan? rentalPlan;
  final DateTimeRange<DateTime>? rangePicked;
  final double totalPrice;
  final List<DateTimeRange>? bookedRanges;

  @override
  List<Object?> get props => [
        route,
        rentalPlan,
        rangePicked,
        totalPrice,
        bookedRanges,
      ];

  const CarDetailsState({
    required this.route,
    required this.rentalPlan,
    required this.rangePicked,
    required this.totalPrice,
    required this.bookedRanges,
  });

  CarDetailsState copyWith({
    CustomizedRoute? route,
    RentalPlan? rentalPlan,
    DateTimeRange<DateTime>? rangePicked,
    double? totalPrice,
    List<DateTimeRange>? bookedRanges,
  }) {
    return CarDetailsState(
      route: route ?? this.route,
      rentalPlan: rentalPlan ?? this.rentalPlan,
      rangePicked: rangePicked ?? this.rangePicked,
      totalPrice: totalPrice ?? this.totalPrice,
      bookedRanges: bookedRanges ?? this.bookedRanges,
    );
  }
}
