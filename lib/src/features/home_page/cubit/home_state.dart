part of 'home_cubit.dart';

class HomeState extends Equatable {
  final CustomizedRoute route;
  final List<MockCar> mockCarList;
  final CarType selectedCarType;
  final String searchQuery;

  @override
  List<Object?> get props => [
        route,
        mockCarList,
        selectedCarType,
        searchQuery,
      ];

  const HomeState({
    required this.route,
    required this.mockCarList,
    required this.selectedCarType,
    required this.searchQuery,

  });

  HomeState copyWith({
    CustomizedRoute? route,
    List<MockCar>? mockCarList,
    CarType? selectedCarType,
    String? searchQuery,
  }) {
    return HomeState(
      route: route ?? this.route,
      mockCarList: mockCarList ?? this.mockCarList,
      selectedCarType: selectedCarType ?? this.selectedCarType,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
