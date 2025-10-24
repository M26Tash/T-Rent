part of 'help_cubit.dart';

class HelpState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const HelpState({
    required this.route,
  });

  HelpState copyWith({
    CustomizedRoute? route,
  }) {
    return HelpState(
      route: route ?? this.route,
    );
  }
}
