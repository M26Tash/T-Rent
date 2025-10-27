part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final CustomizedRoute route;
  final double buttonPosition;
  final List<Offset> tracePoints;
  final Color backgroundColor;
  final bool animationCompleted;

  @override
  List<Object?> get props => [
        route,
        buttonPosition,
        tracePoints,
        backgroundColor,
        animationCompleted,
      ];

  const SplashState({
    required this.route,
    this.buttonPosition = 0.1,
    this.tracePoints = const [],
    this.backgroundColor = Colors.orange,
    this.animationCompleted = false,
  });

  SplashState copyWith({
    CustomizedRoute? route,
    double? buttonPosition,
    List<Offset>? tracePoints,
    Color? backgroundColor,
    bool? animationCompleted,
  }) {
    return SplashState(
      route: route ?? this.route,
      buttonPosition: buttonPosition ?? this.buttonPosition,
      tracePoints: tracePoints ?? this.tracePoints,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      animationCompleted: animationCompleted ?? this.animationCompleted,
    );
  }
}
