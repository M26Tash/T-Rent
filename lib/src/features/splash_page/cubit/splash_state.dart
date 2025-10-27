part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const SplashState({
    required this.route,
  });

  SplashState copyWith({
    CustomizedRoute? route,
  }) {
    return SplashState(
      route: route ?? this.route,
    );
  }
}
