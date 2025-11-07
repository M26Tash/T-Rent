import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_coordinates.dart';

final class CarCoordinatesMapper implements BaseMapper<CarCoordinates> {
  @override
  Map<String, dynamic> toJson(CarCoordinates data) {
    return {
      _Fields.latitude: data.latitude,
      _Fields.longitude: data.longitude,
    };
  }

  @override
  CarCoordinates fromJson(Map<String, dynamic> json) {
    return CarCoordinates(
      latitude: json[_Fields.latitude],
      longitude: json[_Fields.longitude],
    );
  }
}

abstract final class _Fields {
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
}
