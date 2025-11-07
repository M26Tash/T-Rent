import 'package:t_rent/src/common/utils/enums/drive_type.dart';
import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarSpecs extends DomainObject {
  final double engineCapacity;
  final int horsepower;
  final int torque;
  final double zeroToHundred;
  final double topSpeed;
  final DriveType driveType;

  @override
  List<Object?> get props => [
        engineCapacity,
        horsepower,
        torque,
        zeroToHundred,
        topSpeed,
        driveType,
      ];

  const CarSpecs({
    required this.engineCapacity,
    required this.horsepower,
    required this.torque,
    required this.zeroToHundred,
    required this.topSpeed,
    required this.driveType,
  });

  @override
  CarSpecs copyWith() {
    return CarSpecs(
      engineCapacity: engineCapacity,
      horsepower: horsepower,
      torque: torque,
      zeroToHundred: zeroToHundred,
      topSpeed: topSpeed,
      driveType: driveType,
    );
  }
}
