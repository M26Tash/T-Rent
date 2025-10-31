import 'package:t_rent/src/common/utils/enums/car_type.dart';
import 'package:t_rent/src/common/utils/enums/fuel_type.dart';
import 'package:t_rent/src/common/utils/enums/transmission_type.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_coordinates.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_pricing.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_specs.dart';
import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarModel extends DomainObject {
  final int? id;
  final String brand;
  final String model;
  final int year;
  final CarType type;
  final TransmissionType transmissionType;
  final FuelType fuelType;
  final double fuelConsumption;
  final int seats;
  final int doors;
  final double mileage;
  final CarSpecs carSpecs;
  final CarPricing carPricing;
  final CarImage carImage;
  final CarCoordinates carCoordinates;

  @override
  List<Object?> get props => [
        id,
        brand,
        model,
        year,
        type,
        transmissionType,
        fuelType,
        fuelConsumption,
        seats,
        doors,
        mileage,
        carSpecs,
        carPricing,
        carImage,
        carCoordinates,
      ];

  const CarModel({
    required this.brand,
    required this.model,
    required this.year,
    required this.type,
    required this.transmissionType,
    required this.fuelType,
    required this.fuelConsumption,
    required this.seats,
    required this.doors,
    required this.mileage,
    required this.carSpecs,
    required this.carPricing,
    required this.carImage,
    required this.carCoordinates,
    this.id,
  });

  @override
  CarModel copyWith() {
    return CarModel(
      id: id,
      brand: brand,
      model: model,
      year: year,
      type: type,
      transmissionType: transmissionType,
      fuelType: fuelType,
      fuelConsumption: fuelConsumption,
      seats: seats,
      doors: doors,
      mileage: mileage,
      carSpecs: carSpecs,
      carPricing: carPricing,
      carImage: carImage,
      carCoordinates: carCoordinates,
    );
  }
}
