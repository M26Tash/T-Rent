import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_image.dart';

final class CarImageMapper implements BaseMapper<CarImage> {
  @override
  Map<String, dynamic> toJson(CarImage data) {
    return {
      _Fields.frontView: data.frontView,
      _Fields.sideView: data.sideView,
    };
  }

  @override
  CarImage fromJson(Map<String, dynamic> json) {
    return CarImage(
      frontView: json[_Fields.frontView],
      sideView: json[_Fields.sideView],
    );
  }
}

abstract final class _Fields {
  static const String frontView = 'front_view';
  static const String sideView = 'side_view';
}
