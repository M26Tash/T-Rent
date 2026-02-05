// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/interactors/car_audio_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  final DataInteractor _dataInteractor;
  final CarAudioInteractor _audioInteractor;

  CarDetailsCubit(
    this._dataInteractor,
    this._audioInteractor,
  ) : super(
          const CarDetailsState(
            route: CustomizedRoute(
              null,
              null,
            ),
            rentalPlan: null,
            rangePicked: null,
            totalPrice: 0,
            bookedRanges: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<CarOrderModel>?>? _carRentHistorySubscription;

  @override
  Future<void> close() {
    _carRentHistorySubscription?.cancel();
    _carRentHistorySubscription = null;

    return super.close();
  }

  Future<void> _subscribeAll() async {
    await _carRentHistorySubscription?.cancel();
    _carRentHistorySubscription = _dataInteractor.carRentHistoryStream.listen(
      _onNewCarRentHistory,
    );
  }

  Future<void> playRev({required String revAsset}) async {
    return _audioInteractor.playRev(
      revAsset: revAsset,
    );
  }

  Future<void> stopRev() async {
    return _audioInteractor.stopRev();
  }

  Future<void> getCarRentHistory({
    required int carId,
  }) async {
    return _dataInteractor.getCarRentHistory(
      carId: carId,
    );
  }

  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required CarModel car,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _dataInteractor.uploadCarRent(
      carOrder: carOrder,
      car: car,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _onNewCarRentHistory(List<CarOrderModel>? carRentHistory) {
    final bookedRanges = carRentHistory!
        .where((order) => order.startDate != null && order.endDate != null)
        .map(
          (order) => DateTimeRange(
            start: order.startDate!,
            end: order.endDate!,
          ),
        )
        .toList();

    emit(
      state.copyWith(
        bookedRanges: bookedRanges,
      ),
    );
  }

  void onRangePicked(DateTimeRange<DateTime>? range) {
    emit(
      state.copyWith(
        rangePicked: range,
      ),
    );
  }

  void chooseRentalPlan(RentalPlan? plan) {
    log('${state.rentalPlan == plan}');
    if (plan != state.rentalPlan) {
      emit(
        state.copyWith(rentalPlan: plan),
      );
    } else {
      emit(
        state.copyWith(
          rentalPlan: null,
        ),
      );
    }
  }

  void calculateTotalPrice({
    required CarModel car,
  }) {
    final range = state.rangePicked;
    final plan = state.rentalPlan;
    final pricing = car.carPricing;
    if (range == null || plan == null) return;

    final duration = range.duration;

    var total = 0.0;

    switch (plan) {
      case RentalPlan.hourly:
        final hours = duration.inMinutes / 60.0;
        total = (hours * pricing.perHour).ceilToDouble();

      case RentalPlan.daily:
        final days = (duration.inHours / 24).ceil();
        total = days * pricing.perDay;

      case RentalPlan.weekly:
        final weeks = (duration.inDays / 7).ceil();
        total = weeks * pricing.perWeek;
    }

    emit(
      state.copyWith(totalPrice: total),
    );
  }

  void navigateToBooking({
    required CarModel car,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          BookingRoute(
            car: car,
          ),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
