import 'package:t_rent/src/core/data/mappers/base_mapper.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_pricing.dart';

final class CarPricingMapper implements BaseMapper<CarPricing> {
  @override
  Map<String, dynamic> toJson(CarPricing data) {
    return {
      _Fields.perHour : data.perHour,
      _Fields.perDay : data.perDay,
      _Fields.perWeek : data.perWeek,
      _Fields.deposit : data.deposit,
    };
  }

  @override
  CarPricing fromJson(Map<String, dynamic> json) {
    return CarPricing(
      perHour: (json[_Fields.perHour] as num).toDouble(),
      perDay: (json[_Fields.perDay] as num).toDouble(),
      perWeek: (json[_Fields.perWeek] as num).toDouble(),
      deposit: (json[_Fields.deposit] as num).toDouble(),
    );
  }
}

abstract final class _Fields {
  static const String perHour = 'per_hour';
  static const String perDay = 'per_day';
  static const String perWeek = 'per_week';
  static const String deposit = 'deposit';
}
