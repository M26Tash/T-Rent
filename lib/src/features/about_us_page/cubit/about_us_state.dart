part of 'about_us_cubit.dart';

class AboutUsState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const AboutUsState({
    required this.route,
  });

  AboutUsState copyWith({
    CustomizedRoute? route,
  }) {
    return AboutUsState(
      route: route ?? this.route,
    );
  }
}
