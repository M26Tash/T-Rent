part of 'confirmation_cubit.dart';

class ConfirmationState extends Equatable {
  final CustomizedRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const ConfirmationState({
    required this.route,
  });

  ConfirmationState copyWith({
    CustomizedRoute? route,

  }) {
    return ConfirmationState(
      route: route ?? this.route,
    );
  }
}
