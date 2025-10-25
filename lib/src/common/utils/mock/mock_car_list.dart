import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';

final class RentalPlanRate {
  final double pricePerHour;
  final double pricePerDay;
  final double pricePerWeek;

  const RentalPlanRate({
    required this.pricePerHour,
    required this.pricePerDay,
    required this.pricePerWeek,
  });
}

class CarAssets {
  final String sideView;
  final String frontView;

  CarAssets({
    required this.sideView,
    required this.frontView,
  });
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class MockCar {
  final CarAssets assets;
  final CarType type;
  final String brand;
  final String model;
  final String carYear;
  final String consumption;
  final String seats;
  final RentalPlanRate rentalPlanRate;
  final Coordinates coordinates;

  MockCar({
    required this.assets,
    required this.type,
    required this.brand,
    required this.model,
    required this.carYear,
    required this.consumption,
    required this.seats,
    required this.rentalPlanRate,
    required this.coordinates,
  });
}

abstract final class MockCarList {
  static List<MockCar> cars = [
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.audiRsQ8Side,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.suv,
      brand: 'AUDI',
      model: 'RS Q8',
      carYear: '2022',
      consumption: '13.6L',
      seats: '5',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 18000,
        pricePerWeek: 72000,
      ),
      coordinates: const Coordinates(
        latitude: 41.069672,
        longitude: -330.953880,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.audiQ7Side,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.suv,
      brand: 'AUDI',
      model: 'Q7 55 TFSI',
      carYear: '2021',
      consumption: '11.0L',
      seats: '7',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 9000,
        pricePerWeek: 63000,
      ),
      coordinates: const Coordinates(
        latitude: 41.075754,
        longitude: -330.956739,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.audiA6Side,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.sedan,
      brand: 'AUDI',
      model: 'A6 45 TFSI',
      carYear: '2020',
      consumption: '10.5L',
      seats: '5',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 12000,
        pricePerWeek: 84000,
      ),
      coordinates: const Coordinates(
        latitude: 41.066567,
        longitude: -330.981439,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.ferrariSF90Side,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.sport,
      brand: 'FERRARI',
      model: 'SF 90',
      carYear: '2025',
      consumption: '6.1L',
      seats: '2',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 45000,
        pricePerWeek: 540000,
      ),
      coordinates: const Coordinates(
        latitude: 41.026723,
        longitude: 28.983078,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.cadillacEscaladeSide,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.suv,
      brand: 'CADILLAC',
      model: 'Escalade',
      carYear: '2025',
      consumption: '22.0L',
      seats: '7',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 32000,
        pricePerWeek: 224000,
      ),
      coordinates: const Coordinates(
        latitude: 41.028392,
        longitude: 28.987204,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.volkswagenGolfSide,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.hatchback,
      brand: 'VOLKSWAGEN',
      model: 'Golf GTI',
      carYear: '2019',
      consumption: '6.14L',
      seats: '5',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 1500,
        pricePerWeek: 10500,
      ),
      coordinates: const Coordinates(
        latitude: 41.037238,
        longitude: 28.995959,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.mercedesVitoSide,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.minivan,
      brand: 'MERCEDES',
      model: 'V-Class',
      carYear: '2018',
      consumption: '7.0L',
      seats: '8',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 2500,
        pricePerWeek: 17500,
      ),
      coordinates: const Coordinates(
        latitude: 41.037060,
        longitude: 28.995734,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.hyundaiStariaSide,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.minivan,
      brand: 'HYUNDAI',
      model: 'Staria',
      carYear: '2021',
      consumption: '5.5L',
      seats: '8',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 2500,
        pricePerWeek: 17500,
      ),
      coordinates: const Coordinates(
        latitude: 41.044722,
        longitude: 29.016014,
      ),
    ),
    MockCar(
      assets: CarAssets(
        sideView: AppAssets.fordRaptorSide,
        frontView: AppAssets.audiRsQ8Front,
      ),
      type: CarType.pickup,
      brand: 'FORD',
      model: 'F-150 Raptor',
      carYear: '2024',
      consumption: '25.5L',
      seats: '5',
      rentalPlanRate: const RentalPlanRate(
        pricePerHour: 1000,
        pricePerDay: 7500,
        pricePerWeek: 90000,
      ),
      coordinates: const Coordinates(
        latitude: 41.044564,
        longitude: 29.015666,
      ),
    ),
  ];
}
