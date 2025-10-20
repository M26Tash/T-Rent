import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/utils/enums/car_type.dart';

class MockCar {
  final String asset;
  final CarType type;
  final String brand;
  final String model;
  final String consumption;
  final String seats;
  final double pricePerDay;

  MockCar({
    required this.asset,
    required this.type,
    required this.brand,
    required this.model,
    required this.consumption,
    required this.seats,
    required this.pricePerDay,
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
    ),
    MockCar(
      asset: AppAssets.audiQ7Side,
      type: CarType.suv,
      brand: 'AUDI',
      model: 'Q7 55 TFSI',
      consumption: '11.0L',
      seats: '7',
      pricePerDay: 9000,
    ),
    MockCar(
      asset: AppAssets.audiA6Side,
      type: CarType.sedan,
      brand: 'AUDI',
      model: 'A6 45 TFSI',
      consumption: '10.5L',
      seats: '5',
      pricePerDay: 12000,
    ),
    MockCar(
      asset: AppAssets.ferrariSF90Side,
      type: CarType.sport,
      brand: 'FERRARI',
      model: 'SF 90',
      consumption: '6.1L',
      seats: '2',
      pricePerDay: 45000,
    ),
    MockCar(
      asset: AppAssets.cadillacEscaladeSide,
      type: CarType.suv,
      brand: 'CADILLAC',
      model: 'Escalade',
      consumption: '22.0L',
      seats: '7',
      pricePerDay: 32000,
    ),
    MockCar(
      asset: AppAssets.volkswagenGolfSide,
      type: CarType.hatchback,
      brand: 'VOLKSWAGEN',
      model: 'Golf GTI',
      consumption: '6.14L',
      seats: '5',
      pricePerDay: 1500,
    ),
    MockCar(
      asset: AppAssets.mercedesVitoSide,
      type: CarType.minivan,
      brand: 'MERCEDES',
      model: 'V-Class',
      consumption: '7.0L',
      seats: '8',
      pricePerDay: 2500,
    ),
    MockCar(
      asset: AppAssets.hyundaiStariaSide,
      type: CarType.minivan,
      brand: 'HYUNDAI',
      model: 'Staria',
      consumption: '5.5L',
      seats: '8',
      pricePerDay: 2500,
    ),
    MockCar(
      asset: AppAssets.fordRaptorSide,
      type: CarType.pickup,
      brand: 'FORD',
      model: 'F-150 Raptor',
      consumption: '25.5L',
      seats: '5',
      pricePerDay: 7500,
    ),
  ];
}
