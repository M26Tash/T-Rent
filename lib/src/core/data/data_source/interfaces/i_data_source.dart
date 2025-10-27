import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/domain/entities/profile_model/profile_model.dart';

abstract interface class IDataSource {
  Stream<ProfileModel?> get profileStream;

  Future<void> updateProfile(ProfileModel profile);

  Future<void> getProfile();

  Future<void> uploadAvatar(XFile? avatar);
}
