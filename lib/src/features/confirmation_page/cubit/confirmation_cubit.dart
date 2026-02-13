import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_pricing.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'confirmation_state.dart';

class ConfirmationCubit extends Cubit<ConfirmationState> {
  final DataInteractor _dataInteractor;

  ConfirmationCubit(
    this._dataInteractor,
  ) : super(
          const ConfirmationState(
            route: CustomizedRoute(
              null,
              null,
            ),
            totalPrice: null,
            isConfirmed: false,
          ),
        );

  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    emit(
      state.copyWith(
        isConfirmed: true,
      ),
    );

    return _dataInteractor.uploadCarRent(
      carOrder: carOrder,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void calculateTotalAmount({
    required DateTime selectedStart,
    required DateTime selectedEnd,
    required CarPricing carPricing,
  }) {
    final deposit = carPricing.deposit;
    final perWeek = carPricing.perWeek;
    final perDay = carPricing.perDay;
    final perHour = carPricing.perHour;

    final duration = selectedEnd.difference(selectedStart);

    if (duration.isNegative) {
      emit(
        state.copyWith(
          totalPrice: 0,
        ),
      );
      return;
    }
    var totalHours = duration.inHours;
    if (duration.inMinutes % 60 > 0) {
      totalHours += 1;
    }

    var weeks = totalHours ~/ (24 * 7);
    final remainingHoursAfterWeeks = totalHours % (24 * 7);

    var days = remainingHoursAfterWeeks ~/ 24;
    final finalHours = remainingHoursAfterWeeks % 24;

    var hourlyCost = finalHours * perHour;
    if (hourlyCost > perDay) {
      days += 1;
      hourlyCost = 0;
    }

    var daysCost = days * perDay;
    if ((daysCost + hourlyCost) > perWeek) {
      weeks += 1;
      daysCost = 0;
      hourlyCost = 0;
    }
    
    final totalTimeCost = (weeks * perWeek) + daysCost + hourlyCost;

    emit(
      state.copyWith(
        totalPrice: totalTimeCost + deposit,
      ),
    );
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
