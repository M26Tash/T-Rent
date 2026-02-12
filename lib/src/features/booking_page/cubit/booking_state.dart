part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final CustomizedRoute route;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;
  final List<DateTime> months;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final CarModel? car;

  @override
  List<Object?> get props => [
        route,
        selectedStart,
        selectedEnd,
        months,
        startTime,
        endTime,
        car,
      ];

  const BookingState({
    required this.route,
    required this.selectedStart,
    required this.selectedEnd,
    required this.months,
    required this.startTime,
    required this.endTime,
    required this.car,
  });

  BookingState copyWith({
    CustomizedRoute? route,
    DateTime? selectedStart,
    DateTime? selectedEnd,
    bool clearEnd = false,
    List<DateTime>? months,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    CarModel? car,
  }) {
    return BookingState(
      route: route ?? this.route,
      selectedStart: selectedStart ?? this.selectedStart,
      selectedEnd: clearEnd ? null : (selectedEnd ?? this.selectedEnd),
      months: months ?? this.months,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      car: car ?? this.car,
    );
  }
}
