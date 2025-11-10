import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';

final class CarOrderMapper implements BaseMapper<CarOrderModel> {
  @override
  Map<String, dynamic> toJson(CarOrderModel data) {
    return {
      _Fields.userId: data.userId,
      _Fields.carId: data.carId,
      _Fields.startDate: data.startDate?.toIso8601String(),
      _Fields.endDate: data.endDate?.toIso8601String(),
    };
  }

  @override
  CarOrderModel fromJson(Map<String, dynamic> json) {
    return CarOrderModel(
      id: json[_Fields.id],
      createdAt: json[_Fields.createdAt] == null
          ? null
          : DateTime.tryParse(
              json[_Fields.createdAt],
            ),
      userId: json[_Fields.userId],
      carId: json[_Fields.carId],
      car: CarMapper().fromJson(
        json[_Fields.car],
      ),
      startDate: json[_Fields.startDate] == null
          ? null
          : DateTime.tryParse(
              json[_Fields.startDate],
            ),
      endDate: json[_Fields.endDate] == null
          ? null
          : DateTime.tryParse(
              json[_Fields.endDate],
            ),
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String createdAt = 'created_at';
  static const String userId = 'user_id';
  static const String carId = 'car_id';
  static const String car = 'cars';
  static const String startDate = 'start_date';
  static const String endDate = 'end_date';
}
