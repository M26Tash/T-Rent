// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';

part 'car_details_state.dart';

class CarDetailsCubit extends Cubit<CarDetailsState> {
  CarDetailsCubit()
      : super(
          const CarDetailsState(
            route: CustomizedRoute(null, null),
            rentalPlan: null,
          ),
        );

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
