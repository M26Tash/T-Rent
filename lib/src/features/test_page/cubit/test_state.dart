part of 'test_cubit.dart';

class TestState extends Equatable {
  final CustomizedRoute route;
  @override
  List<Object?> get props => [
        route,
      ];

  const TestState({
    required this.route,
  });

  TestState copyWith({
    CustomizedRoute? route,

  }) {
    return TestState(
      route: route ?? this.route,
    );
  }
}
