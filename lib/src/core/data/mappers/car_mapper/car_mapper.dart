import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/enums/fuel_type.dart';
import 'package:t_rent/src/common/utils/enums/transmission_type.dart';
import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_coordinates_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_image_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_pricing_mapper.dart';
import 'package:t_rent/src/core/data/mappers/car_mapper/car_specs_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

final class CarMapper implements BaseMapper<CarModel> {
  @override
  Map<String, dynamic> toJson(CarModel data) {
    return {
      _Fields.id: data.id,
      _Fields.brand: data.brand,
      _Fields.model: data.model,
      _Fields.year: data.year,
      _Fields.type: data.type.name,
      _Fields.transmissionType: data.transmissionType.name,
      _Fields.fuelType: data.fuelType.name,
      _Fields.fuelConsumption: data.fuelConsumption,
      _Fields.seats: data.seats,
      _Fields.doors: data.doors,
      _Fields.mileage: data.mileage,
      _Fields.carSpecs: CarSpecsMapper().toJson(
        data.carSpecs,
      ),
      _Fields.carPricing: CarPricingMapper().toJson(
        data.carPricing,
      ),
      _Fields.carImage: CarImageMapper().toJson(
        data.carImage,
      ),
      _Fields.carCoordinates: CarCoordinatesMapper().toJson(
        data.carCoordinates,
      ),
    };
  }

  @override
  CarModel fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json[_Fields.id],
      brand: json[_Fields.brand],
      model: json[_Fields.model],
      year: json[_Fields.year],
      type: carTypeFromString(
        json[_Fields.type],
      ),
      transmissionType: transmissionTypeFromString(
        json[_Fields.transmissionType],
      ),
      fuelType: fuelTypeFromString(
        json[_Fields.fuelType],
      ),
      fuelConsumption: (json[_Fields.fuelConsumption] as num).toDouble(),
      seats: json[_Fields.seats],
      doors: json[_Fields.doors],
      mileage: (json[_Fields.mileage] as num).toDouble(),
      carSpecs: CarSpecsMapper().fromJson(
        json[_Fields.carSpecs],
      ),
      carPricing: CarPricingMapper().fromJson(
        json[_Fields.carPricing],
      ),
      carImage: CarImageMapper().fromJson(
        json[_Fields.carImage],
      ),
      carCoordinates: CarCoordinatesMapper().fromJson(
        json[_Fields.carCoordinates],
      ),
      carMotorRevAsset: json[_Fields.carMotorRevAsset],
    );
  }
}

abstract final class _Fields {
  static const String id = 'id';
  static const String brand = 'brand';
  static const String model = 'model';
  static const String year = 'year';
  static const String type = 'type';
  static const String transmissionType = 'transmission_type';
  static const String fuelType = 'fuel_type';
  static const String fuelConsumption = 'fuel_consumption';
  static const String seats = 'seats';
  static const String doors = 'doors';
  static const String mileage = 'mileage';
  static const String carSpecs = 'car_specs';
  static const String carPricing = 'car_pricing';
  static const String carImage = 'car_image';
  static const String carCoordinates = 'car_coordinates';
  static const String carMotorRevAsset = 'car_motor_rev';
}
