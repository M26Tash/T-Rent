import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

abstract interface class IDataRepository {
  Stream<ProfileModel?> get profileStream;

  Stream<List<CarModel>?> get carStream;

  Stream<List<CarOrderModel>?> get carRentHistoryStream;

  Future<void> updateProfile(ProfileModel profile);

  Future<void> getProfile();

  Future<void> uploadAvatar(XFile? avatar);

  Future<void> getCars();

  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required CarModel car,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<void> getCarRentHistory();
}
