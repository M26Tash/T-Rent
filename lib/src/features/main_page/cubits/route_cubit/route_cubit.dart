import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  final DataInteractor _dataInteractor;
  RouteCubit(
    this._dataInteractor,
  ) : super(
          const RouteState(
            route: CustomizedRoute(
              null,
              null,
            ),
            cars: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<CarModel>?>? _carsSubscription;

  @override
  Future<void> close() {
    _carsSubscription?.cancel();
    _carsSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _carsSubscription?.cancel();
    _carsSubscription = _dataInteractor.carStream.listen(
      _onNewCars,
    );
  }

  Future<void> getCars() async {
    return _dataInteractor.getCars();
  }

  void _onNewCars(List<CarModel>? cars) {
    emit(
      state.copyWith(
        cars: cars,
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
