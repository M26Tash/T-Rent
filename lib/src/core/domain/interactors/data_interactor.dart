import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interfaces/i_data_repository.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;

  DataInteractor(this._dataRepository);

  Stream<ProfileModel?> get profileStream => _dataRepository.profileStream;

  Stream<List<CarModel>?> get carStream => _dataRepository.carStream;

  Stream<List<CarOrderModel>?> get carRentHistoryStream =>
      _dataRepository.carRentHistoryStream;

  Future<void> updateProfile(ProfileModel profile) async {
    return _dataRepository.updateProfile(profile);
  }

  Future<void> getProfile() async {
    return _dataRepository.getProfile();
  }

  Future<void> uploadAvatar(XFile? avatar) async {
    return _dataRepository.uploadAvatar(avatar);
  }

  Future<void> getCars() async {
    return _dataRepository.getCars();
  }

  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required CarModel car,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _dataRepository.uploadCarRent(
      carOrder: carOrder,
      car: car,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<void> getCarRentHistory() async {
    return _dataRepository.getCarRentHistory();
  }
}
