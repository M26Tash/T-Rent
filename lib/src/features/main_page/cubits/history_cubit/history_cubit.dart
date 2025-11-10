import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final DataInteractor _dataInteractor;
  HistoryCubit(
    this._dataInteractor,
  ) : super(
          const HistoryState(
            route: CustomizedRoute(
              null,
              null,
            ),
            carRentHistory: null,
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

  void _subscribeAll() {
    _carRentHistorySubscription?.cancel();
    _carRentHistorySubscription = _dataInteractor.carRentHistoryStream.listen(
      _onNewCarRentHistory,
    );
  }

  Future<void> getProfile() async {
    return _dataInteractor.getProfile();
  }

  Future<void> getCars() async {
    return _dataInteractor.getCars();
  }

  void _onNewCarRentHistory(List<CarOrderModel>? carRentHistory) {
    emit(
      state.copyWith(
        carRentHistory: carRentHistory,
      ),
    );
  }

  Future<void> getCarRentHistory() async {
    return _dataInteractor.getCarRentHistory();
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
