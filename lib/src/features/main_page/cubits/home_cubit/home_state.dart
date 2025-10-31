part of 'home_cubit.dart';

class HomeState extends Equatable {
  final CustomizedRoute route;
  final ProfileModel? profile;
  final List<CarModel>? cars;
  final List<CarModel>? allCars;
  final CarType selectedCarType;
  final String searchQuery;
  final String? userAddress;
  final bool isAddressLoading;

  @override
  List<Object?> get props => [
        route,
        profile,
        cars,
        allCars,
        selectedCarType,
        searchQuery,
        userAddress,
        isAddressLoading,
      ];

  const HomeState({
    required this.route,
    required this.profile,
    required this.cars,
    required this.allCars,
    required this.selectedCarType,
    required this.searchQuery,
    required this.userAddress,
    required this.isAddressLoading,
  });

  HomeState copyWith({
    CustomizedRoute? route,
    ProfileModel? profile,
    List<CarModel>? cars,
    List<CarModel>? allCars,
    CarType? selectedCarType,
    String? searchQuery,
    String? userAddress,
    bool? isAddressLoading,
  }) {
    return HomeState(
      route: route ?? this.route,
      profile: profile ?? this.profile,
      cars: cars ?? this.cars,
      allCars: allCars ?? this.allCars,
      selectedCarType: selectedCarType ?? this.selectedCarType,
      searchQuery: searchQuery ?? this.searchQuery,
      userAddress: userAddress ?? this.userAddress,
      isAddressLoading: isAddressLoading ?? this.isAddressLoading,
    );
  }
}
