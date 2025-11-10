// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/enums/filter_tab.dart';
import 'package:t_rent/src/common/utils/enums/sort_order.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DataInteractor _dataInteractor;
  HomeCubit(
    this._dataInteractor,
  ) : super(
          const HomeState(
            route: CustomizedRoute(
              null,
              null,
            ),
            profile: null,
            cars: null,
            allCars: null,
            selectedCarType: CarType.all,
            searchQuery: '',
            userAddress: null,
            isAddressLoading: true,
            filterTab: FilterTab.price,
            sortOrder: SortOrder.descending,
          ),
        ) {
    _initUserAddress();
    _subscribeAll();
  }

  StreamSubscription<ProfileModel?>? _profileSubscription;
  StreamSubscription<List<CarModel>?>? _carsSubscription;

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _profileSubscription = null;

    _carsSubscription?.cancel();
    _carsSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _profileSubscription?.cancel();
    _profileSubscription = _dataInteractor.profileStream.listen(
      _onNewProfile,
    );

    _carsSubscription?.cancel();
    _carsSubscription = _dataInteractor.carStream.listen(
      _onNewCars,
    );
  }

  Future<void> getProfile() async {
    return _dataInteractor.getProfile();
  }

  Future<void> getCars() async {
    return _dataInteractor.getCars();
  }

  void _onNewProfile(ProfileModel? profile) {
    emit(
      state.copyWith(
        profile: profile,
      ),
    );
  }

  void _onNewCars(List<CarModel>? cars) {
    emit(
      state.copyWith(
        allCars: cars,
        cars: cars,
      ),
    );

    _filterCars();
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

  // Future<String?> _getUserAddress() async {
  //   final permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     return 'Permission denied';
  //   }

  //   final position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );

  //   final placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);

  //   final place = placemarks.first;
  //   emit(
  //     state.copyWith(
  //       userAddress:
  //           // ignore: lines_longer_than_80_chars
  //           '${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.street}, ${place.postalCode}',
  //       isAddressLoading: true,
  //     ),
  //   );
  //   return null;
  // }

  Future<String?> _getUserAddress() async {
    try {
      emit(
        state.copyWith(
          isAddressLoading: true,
        ),
      );

      final permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(state.copyWith(isAddressLoading: false));
        return 'Permission denied';
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.lowest,
        timeLimit: const Duration(
          seconds: 5,
        ),
      );

      final placemarksFuture = placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final placemarks = await placemarksFuture;

      if (placemarks.isEmpty) {
        emit(state.copyWith(isAddressLoading: false));
        return 'Address not found';
      }

      final place = placemarks.first;

      emit(
        state.copyWith(
          userAddress: '${place.administrativeArea ?? ''}, '
              '${place.subAdministrativeArea ?? ''}, '
              '${place.street ?? ''}, '
              '${place.postalCode ?? ''}',
          isAddressLoading: false,
        ),
      );

      return null;
    } on TimeoutException {
      emit(
        state.copyWith(
          isAddressLoading: false,
        ),
      );
      return 'Location request timed out';
    } on PermissionDeniedException {
      emit(
        state.copyWith(
          isAddressLoading: false,
        ),
      );
      return 'Location permission denied';
    } on LocationServiceDisabledException {
      emit(
        state.copyWith(
          isAddressLoading: false,
        ),
      );
      return 'Location services are disabled';
    } catch (e) {
      emit(
        state.copyWith(
          isAddressLoading: false,
        ),
      );
      return 'Failed to get address: $e';
    }
  }

  void onSortOrderSelect(SortOrder sortOrder) {
    emit(
      state.copyWith(
        sortOrder: sortOrder,
      ),
    );
    _filterCars();
  }

  void onFilterTabSelect(FilterTab tab) {
    emit(
      state.copyWith(
        filterTab: tab,
      ),
    );
    _filterCars();
  }

  void onCarTypeSelect(CarType type) {
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
    final filtered = state.allCars?.where((car) {
      final matchesType = state.selectedCarType == CarType.all ||
          car.type == state.selectedCarType;

      final matchesSearch =
          car.brand.toLowerCase().contains(state.searchQuery.toLowerCase()) ||
              car.model.toLowerCase().contains(state.searchQuery.toLowerCase());

      return matchesType && matchesSearch;
    }).toList();

    if (filtered != null) {
      int Function(CarModel, CarModel) comparator;

      switch (state.filterTab) {
        case FilterTab.price:
          comparator = (a, b) => a.carPricing.perDay.compareTo(
                b.carPricing.perDay,
              );

        case FilterTab.year:
          comparator = (a, b) => a.year.compareTo(
                b.year,
              );

        case FilterTab.mileage:
          comparator = (a, b) => a.mileage.compareTo(
                b.mileage,
              );
      }

      filtered.sort((a, b) => state.sortOrder == SortOrder.ascending
          ? comparator(a, b)
          : comparator(b, a));
    }

    emit(
      state.copyWith(
        cars: filtered,
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
