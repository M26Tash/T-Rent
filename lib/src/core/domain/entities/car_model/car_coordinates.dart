import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarCoordinates extends DomainObject {
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];

  const CarCoordinates({
    required this.latitude,
    required this.longitude,
  });

  @override
  CarCoordinates copyWith() {
    return CarCoordinates(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
