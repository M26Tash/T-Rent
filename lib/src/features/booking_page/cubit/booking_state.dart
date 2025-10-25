part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const BookingState({
    required this.route,
  });

  BookingState copyWith({
    CustomizedRoute? route,
  }) {
    return BookingState(
      route: route ?? this.route,
    );
  }
}
