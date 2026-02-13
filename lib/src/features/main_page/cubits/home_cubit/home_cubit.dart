// ignore_for_file: avoid_catches_without_on_clauses

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
    initUserAddress();
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

  Future<void> _subscribeAll() async {
    _profileSubscription?.cancel();
    _profileSubscription = _dataInteractor.profileStream.listen(
      _onNewProfile,
    );

    await _carsSubscription?.cancel();
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

  Future<String> _getFormattedAddress() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception('Location services are disabled');

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissions are permanently denied');
    }

    try {
      var position = await Geolocator.getLastKnownPosition();

      position ??= await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.low,
        // ignore: deprecated_member_use
        timeLimit: const Duration(seconds: 10),
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) throw Exception('Address not found');

      final p = placemarks.first;
      return '${p.administrativeArea ?? ''}, ${p.subAdministrativeArea ?? ''}';
    } on TimeoutException {
      final lastPos = await Geolocator.getLastKnownPosition();
      if (lastPos != null) {
        final placemarks =
            await placemarkFromCoordinates(lastPos.latitude, lastPos.longitude);
        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          // ignore: lines_longer_than_80_chars
          return '${p.administrativeArea ?? ''}, ${p.subAdministrativeArea ?? ''}';
        }
      }
      throw Exception(
        'Location request timed out. Please check your GPS signal.',
      );
    }
  }

  Future<void> initUserAddress() async {
    if (isClosed) return;

    emit(state.copyWith(isAddressLoading: true));

    try {
      final address = await _getFormattedAddress();
      if (!isClosed) {
        emit(
          state.copyWith(
            userAddress: address,
            isAddressLoading: false,
          ),
        );
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            userAddress: e.toString(),
            isAddressLoading: false,
          ),
        );
      }
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

      filtered.sort(
        (a, b) => state.sortOrder == SortOrder.ascending
            ? comparator(a, b)
            : comparator(b, a),
      );
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
