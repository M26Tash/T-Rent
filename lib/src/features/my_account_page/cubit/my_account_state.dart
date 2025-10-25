part of 'my_account_cubit.dart';

class MyAccountState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const MyAccountState({
    required this.route,
  });

  MyAccountState copyWith({
    CustomizedRoute? route,
  }) {
    return MyAccountState(
      route: route ?? this.route,
    );
  }
}
