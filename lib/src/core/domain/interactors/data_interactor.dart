import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';
import 'package:t_rent/src/core/domain/interfaces/i_data_repository.dart';

final class DataInteractor {
  final IDataRepository _dataRepository;

  DataInteractor(this._dataRepository);

  Stream<ProfileModel?> get profileStream => _dataRepository.profileStream;

  Future<void> updateProfile(ProfileModel profile) async {
    return _dataRepository.updateProfile(profile);
  }

  Future<void> getProfile() async {
    return _dataRepository.getProfile();
  }

  Future<void> uploadAvatar(XFile? avatar) async {
    return _dataRepository.uploadAvatar(avatar);
  }
}
