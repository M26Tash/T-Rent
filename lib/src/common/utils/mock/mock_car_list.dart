import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class MockCar {
  final String asset;
  final CarType type;
  final String brand;
  final String model;
  final String consumption;
  final String seats;
  final double pricePerDay;
  final Coordinates coordinates;

  MockCar({
    required this.asset,
    required this.type,
    required this.brand,
    required this.model,
    required this.consumption,
    required this.seats,
    required this.pricePerDay,
    required this.coordinates,
  });
}

abstract final class MockCarList {
  static List<MockCar> cars = [
    MockCar(
      asset: AppAssets.audiRsQ8Side,
      type: CarType.suv,
      brand: 'AUDI',
      model: 'RS Q8',
      consumption: '13.6L',
      seats: '5',
      pricePerDay: 18000,
      coordinates: const Coordinates(
        latitude: 41.069672,
        longitude: -330.953880,
      ),
    ),
    MockCar(
      asset: AppAssets.audiQ7Side,
      type: CarType.suv,
      brand: 'AUDI',
      model: 'Q7 55 TFSI',
      consumption: '11.0L',
      seats: '7',
      pricePerDay: 9000,
       coordinates: const Coordinates(
        latitude: 41.075754,
        longitude: -330.956739,
      ),
    ),
    MockCar(
      asset: AppAssets.audiA6Side,
      type: CarType.sedan,
      brand: 'AUDI',
      model: 'A6 45 TFSI',
      consumption: '10.5L',
      seats: '5',
      pricePerDay: 12000,
       coordinates: const Coordinates(
        latitude: 41.066567,
        longitude: -330.981439,
      ),
    ),
    MockCar(
      asset: AppAssets.ferrariSF90Side,
      type: CarType.sport,
      brand: 'FERRARI',
      model: 'SF 90',
      consumption: '6.1L',
      seats: '2',
      pricePerDay: 45000,
       coordinates: const Coordinates(
        latitude: 41.026723,
        longitude: 28.983078,
      ),
    ),
    MockCar(
      asset: AppAssets.cadillacEscaladeSide,
      type: CarType.suv,
      brand: 'CADILLAC',
      model: 'Escalade',
      consumption: '22.0L',
      seats: '7',
      pricePerDay: 32000,
       coordinates: const Coordinates(
        latitude: 41.028392,
        longitude: 28.987204,
      ),
    ),
    MockCar(
      asset: AppAssets.volkswagenGolfSide,
      type: CarType.hatchback,
      brand: 'VOLKSWAGEN',
      model: 'Golf GTI',
      consumption: '6.14L',
      seats: '5',
      pricePerDay: 1500,
       coordinates: const Coordinates(
        latitude: 41.037238,
        longitude: 28.995959,
      ),
    ),
    MockCar(
      asset: AppAssets.mercedesVitoSide,
      type: CarType.minivan,
      brand: 'MERCEDES',
      model: 'V-Class',
      consumption: '7.0L',
      seats: '8',
      pricePerDay: 2500,
       coordinates: const Coordinates(
        latitude: 41.037060,
        longitude: 28.995734,
      ),
    ),
    MockCar(
      asset: AppAssets.hyundaiStariaSide,
      type: CarType.minivan,
      brand: 'HYUNDAI',
      model: 'Staria',
      consumption: '5.5L',
      seats: '8',
      pricePerDay: 2500,
       coordinates: const Coordinates(
        latitude: 41.044722,
        longitude: 29.016014,
      ),
    ),
    MockCar(
      asset: AppAssets.fordRaptorSide,
      type: CarType.pickup,
      brand: 'FORD',
      model: 'F-150 Raptor',
      consumption: '25.5L',
      seats: '5',
      pricePerDay: 7500,
       coordinates: const Coordinates(
        latitude: 41.044564,
        longitude: 29.015666,
      ),
    ),
  ];
}
