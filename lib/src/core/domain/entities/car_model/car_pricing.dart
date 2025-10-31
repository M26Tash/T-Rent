import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarPricing extends DomainObject {
  final double perHour;
  final double perDay;
  final double perWeek;
  final double deposit;

  @override
  List<Object?> get props => [
        perHour,
        perDay,
        perWeek,
        deposit,
      ];

  const CarPricing({
    required this.perHour,
    required this.perDay,
    required this.perWeek,
    required this.deposit,
  });

  double priceFor(RentalPlan plan) {
    switch (plan) {
      case RentalPlan.hourly:
        return perHour;
      case RentalPlan.daily:
        return perDay;
      case RentalPlan.weekly:
        return perWeek;
    }
  }

  @override
  CarPricing copyWith() {
    return CarPricing(
      perHour: perHour,
      perDay: perDay,
      perWeek: perWeek,
      deposit: deposit,
    );
  }
}
