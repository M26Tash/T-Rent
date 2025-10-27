// ignore_for_file: deprecated_member_use

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(
            route: const CustomizedRoute(
              null,
              null,
            ),
            mockCarList: MockCarList.cars,
            selectedCarType: CarType.all,
            searchQuery: '',
            userAddress: null,
            isAddressLoading: true,
          ),
        ) {
    _initUserAddress();
  }

  Future<void> _initUserAddress() async {
    final fetchedAddress = await _getUserAddress();

    emit(
      state.copyWith(
        userAddress: fetchedAddress,
        isAddressLoading: false,
      ),
    );
  }

  Future<String?> _getUserAddress() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return 'Permission denied';
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    final place = placemarks.first;
    emit(
      state.copyWith(
        userAddress:
            // ignore: lines_longer_than_80_chars
            '${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.street}, ${place.postalCode}',
        isAddressLoading: true,
      ),
    );
    return null;
  }

  void selectCarType(CarType type) {
    emit(
      state.copyWith(
        selectedCarType: type,
      ),
    );
    _filterCars();
  }

  void updateSearchQuery(String query) {
    emit(
      state.copyWith(
        searchQuery: query,
      ),
    );
    _filterCars();
  }

  void _filterCars() {
    final filtered = MockCarList.cars.where((car) {
      final matchesType = state.selectedCarType == CarType.all ||
          car.type == state.selectedCarType;

      final matchesSearch =
          car.brand.toLowerCase().contains(state.searchQuery.toLowerCase()) ||
              car.model.toLowerCase().contains(state.searchQuery.toLowerCase());

      return matchesType && matchesSearch;
    }).toList();

    emit(
      state.copyWith(
        mockCarList: filtered,
      ),
    );
  }

  // ignore: unused_element
  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
