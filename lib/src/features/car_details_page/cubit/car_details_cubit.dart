import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/interactors/car_audio_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';
import 'package:t_rent/src/core/domain/utils/core_logger.dart';

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
            isCarFavorite: null,
          ),
        );

  Future<void> toggleFavorite({required int carId}) async {
    final previousState = state.isCarFavorite ?? false;
    final newState = !previousState;

    emit(
      state.copyWith(
        isCarFavorite: newState,
      ),
    );

    try {
      await _dataInteractor.updateFavoriteStatus(
        carId: carId,
        isFavorite: newState,
      );
    } on Exception catch (e) {
      CoreLogger.errorLog(
        'updateFavoriteStatus() in CarDetailsCubit',
        params: {
          'Exception': e,
        },
      );
    }
  }

  void initFavroiteState({required bool isFavoriteCar}) {
    emit(
      state.copyWith(
        isCarFavorite: isFavoriteCar,
      ),
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

  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _dataInteractor.uploadCarRent(
      carOrder: carOrder,
      startDate: startDate,
      endDate: endDate,
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
