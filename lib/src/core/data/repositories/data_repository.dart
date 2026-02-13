import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interfaces/i_data_repository.dart';

final class DataRepository implements IDataRepository {
  final IDataSource _dataSource;

  DataRepository(this._dataSource);

  @override
  Stream<ProfileModel?> get profileStream => _dataSource.profileStream;

  @override
  Stream<List<CarModel>?> get carStream => _dataSource.carStream;

  @override
  Stream<List<CarOrderModel>?> get carRentHistoryStream =>
      _dataSource.carRentHistoryStream;

  @override
  Future<void> updateProfile(ProfileModel profile) async {
    return _dataSource.updateProfile(profile);
  }

  @override
  Future<void> getProfile() async {
    return _dataSource.getProfile();
  }

  @override
  Future<void> uploadAvatar(XFile? avatar) async {
    return _dataSource.uploadAvatar(avatar);
  }

  @override
  Future<void> getCars() async {
    return _dataSource.getCars();
  }

  @override
  Future<void> uploadCarRent({
    required CarOrderModel carOrder,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return _dataSource.uploadCarRent(
      carOrder: carOrder,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Future<void> updateFavoriteStatus({
    required int carId,
    required bool isFavorite,
  }) async {
    return _dataSource.updateFavoriteStatus(
      carId: carId,
      isFavorite: isFavorite,
    );
  }

  @override
  Future<void> getCarRentHistory({
    int? carId,
  }) async {
    return _dataSource.getCarRentHistory(
      carId: carId,
    );
  }
}
