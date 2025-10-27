import 'package:image_picker/image_picker.dart';

abstract interface class IFileDataSource {

  Stream<XFile?> get imageStream;

  Stream<XFile?> get photoStream;

  Future<void> getImage();

  Future<void> capturePhoto();
}
