part of 'home_cubit.dart';

class HomeState extends Equatable {
  final CustomizedRoute route;
  final List<MockCar> mockCarList;
  final CarType selectedCarType;
  final String searchQuery;
  final String? userAddress;
  final bool isAddressLoading;

  @override
  List<Object?> get props => [
        route,
        mockCarList,
        selectedCarType,
        searchQuery,
        userAddress,
        isAddressLoading,
      ];

  const HomeState({
    required this.route,
    required this.mockCarList,
    required this.selectedCarType,
    required this.searchQuery,
    required this.userAddress,
    required this.isAddressLoading,
  });

  HomeState copyWith({
    CustomizedRoute? route,
    List<MockCar>? mockCarList,
    CarType? selectedCarType,
    String? searchQuery,
    String? userAddress,
    bool? isAddressLoading,
  }) {
    return HomeState(
      route: route ?? this.route,
      mockCarList: mockCarList ?? this.mockCarList,
      selectedCarType: selectedCarType ?? this.selectedCarType,
      searchQuery: searchQuery ?? this.searchQuery,
      userAddress: userAddress ?? this.userAddress,
      isAddressLoading: isAddressLoading ?? this.isAddressLoading,
    );
  }
}
