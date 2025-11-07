import 'package:t_rent/src/core/domain/entities/domain_object.dart';

final class CarImage extends DomainObject {
  final String frontView;
  final String sideView;

  @override
  List<Object?> get props => [
        frontView,
        sideView,
      ];

  const CarImage({
    required this.frontView,
    required this.sideView,
  });

  @override
  CarImage copyWith() {
    return CarImage(
      frontView: frontView,
      sideView: sideView,
    );
  }
}
