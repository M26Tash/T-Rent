part of 'confirmation_cubit.dart';

class ConfirmationState extends Equatable {
  final CustomizedRoute route;
  final double? totalPrice;
  final bool isConfirmed;

  @override
  List<Object?> get props => [
        route,
        totalPrice,
        isConfirmed,
      ];

  const ConfirmationState({
    required this.route,
    required this.totalPrice,
    required this.isConfirmed,
  });

  ConfirmationState copyWith({
    CustomizedRoute? route,
    double? totalPrice,
    bool? isConfirmed,
  }) {
    return ConfirmationState(
      route: route ?? this.route,
      totalPrice: totalPrice ?? this.totalPrice,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }
}
