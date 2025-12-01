import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarOrderModel extends DomainObject {
  final int? id;
  final DateTime? createdAt;
  final String? userId;
  final int carId;
  final CarModel car;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? totalPrice;
  final int? totalDays;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        userId,
        carId,
        car,
        startDate,
        endDate,
        totalPrice,
        totalDays,
      ];

  const CarOrderModel({
    required this.carId,
    required this.car,
    required this.startDate,
    required this.endDate,
    this.id,
    this.userId,
    this.createdAt,
    this.totalPrice,
    this.totalDays,
  });

  @override
  CarOrderModel copyWith({
    String? userId,
    double? totalPrice,
    int? totalDays,
  }) {
    return CarOrderModel(
      id: id,
      createdAt: createdAt,
      userId: userId ?? this.userId,
      carId: carId,
      car: car,
      startDate: startDate,
      endDate: endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      totalDays: totalDays ?? this.totalDays,
    );
  }
}
