// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  final DataInteractor _dataInteractor;
  CarDetailsCubit(
    this._dataInteractor,
  ) : super(
          const CarDetailsState(
            route: CustomizedRoute(null, null),
            rentalPlan: null,
            rangePicked: null,
            totalPrice: 0,
          ),
        );

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

  void navigateToBooking() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(
          TypeRoute.navigateTo,
          BookingRoute(),
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
