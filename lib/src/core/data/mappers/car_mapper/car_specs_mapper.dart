import 'package:t_rent/src/common/utils/enums/drive_type.dart';
import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_specs.dart';

final class CarSpecsMapper implements BaseMapper<CarSpecs> {
  @override
  Map<String, dynamic> toJson(CarSpecs data) {
    return {
      _Fields.engineCapacity: data.engineCapacity,
      _Fields.horsepower: data.horsepower,
      _Fields.torque: data.torque,
      _Fields.zeroToHundred: data.zeroToHundred,
      _Fields.topSpeed: data.topSpeed,
      _Fields.driveType: data.driveType.name,
    };
  }

  @override
  CarSpecs fromJson(Map<String, dynamic> json) {
    return CarSpecs(
      engineCapacity: (json[_Fields.engineCapacity] as num).toDouble(),
      horsepower: json[_Fields.horsepower],
      torque: json[_Fields.torque],
      zeroToHundred: json[_Fields.zeroToHundred],
      topSpeed: (json[_Fields.topSpeed] as num).toDouble(),
      driveType: driveTypeFromString(
        json[_Fields.driveType],
      ),
    );
  }
}

abstract final class _Fields {
  static const String engineCapacity = 'engine_capacity';
  static const String horsepower = 'horsepower';
  static const String torque = 'torque';
  static const String zeroToHundred = 'zero_to_hundred';
  static const String topSpeed = 'top_speed';
  static const String driveType = 'drive_type';
}
