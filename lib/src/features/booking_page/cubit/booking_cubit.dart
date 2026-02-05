// ignore_for_file: avoid_redundant_argument_values

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/utils/extensions/date_helper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

part 'booking_state.dart';

final DateTime dateStart = DateTime.now();
final DateTime dateEnd = DateTime.now().add(
  const Duration(
    days: 365,
  ),
);

class BookingCubit extends Cubit<BookingState> {
  BookingCubit()
      : super(
          const BookingState(
            route: CustomizedRoute(
              null,
              null,
            ),
            selectedStart: null,
            selectedEnd: null,
            months: [],
            startTime: null,
            endTime: null,
          ),
        ) {
    generateMonths(dateStart, dateEnd);
  }

  // void updateTimes({TimeOfDay? start, TimeOfDay? end}) {
  //   emit(state.copyWith(
  //     startTime: start ?? state.startTime,
  //     endTime: end ?? state.endTime,
  //   ));
  // }

  void updateTimes({TimeOfDay? start, TimeOfDay? end}) {
    var newStart = state.selectedStart;
    var newEnd = state.selectedEnd;

    if (start != null && newStart != null) {
      newStart = DateTime(
        newStart.year,
        newStart.month,
        newStart.day,
        start.hour,
        start.minute,
      );
    }

    if (end != null && newEnd != null) {
      newEnd = DateTime(
        newEnd.year,
        newEnd.month,
        newEnd.day,
        end.hour,
        end.minute,
      );
    }

    emit(
      state.copyWith(
        selectedStart: newStart,
        selectedEnd: newEnd,
        startTime: start ?? state.startTime,
        endTime: end ?? state.endTime,
      ),
    );
  }

  void onDayTap(DateTime date) {
    final start = state.selectedStart;
    final end = state.selectedEnd;

    if (start != null && end != null) {
      emit(
        state.copyWith(
          selectedStart: date,
          clearEnd: true,
        ),
      );
      return;
    }

    if (start == null) {
      emit(
        state.copyWith(
          selectedStart: date,
        ),
      );
      return;
    }

    if (date.isSameDay(start)) {
      emit(
        state.copyWith(
          selectedStart: null,
          clearEnd: true,
        ),
      );
    } else if (date.isBefore(start)) {
      emit(
        state.copyWith(
          selectedStart: date,
          clearEnd: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedEnd: date,
        ),
      );
    }
  }

  void generateMonths(DateTime start, DateTime end) {
    final months = <DateTime>[];
    var current = DateTime(start.year, start.month);

    while (!current.isAfter(end)) {
      months.add(current);
      current = DateTime(current.year, current.month + 1);
    }

    emit(
      state.copyWith(
        months: months,
      ),
    );
  }

  List<DateTime> generateMonthGrid(DateTime month) {
    final firstDay = DateTime(month.year, month.month);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final prevMonthLastDay = DateTime(month.year, month.month, 0);

    final shift = firstDay.weekday - 1;
    final totalCells = shift + lastDay.day;

    return List.generate(totalCells, (index) {
      if (index < shift) {
        return DateTime(
          prevMonthLastDay.year,
          prevMonthLastDay.month,
          prevMonthLastDay.day - (shift - index - 1),
        );
      }
      return DateTime(
        month.year,
        month.month,
        index - shift + 1,
      );
    });
  }

  void navigateToConfirmationPage({
    required CarModel car,
  }) {
    emit(
      state.copyWith(
        route: CustomizedRoute(
          TypeRoute.navigateTo,
          ConfirmationRoute(
            // car: car,
            // selectedStart: state.selectedStart!,
            // selectedEnd: state.selectedEnd!,
          ),
          shouldClearStack: true,
        ),
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
