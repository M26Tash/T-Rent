import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/domain/interfaces/i_file_repository.dart';

final class FileInteractor {
  final IFileRepository _fileRepository;

  const FileInteractor(this._fileRepository);

  Stream<XFile?> get imageStream => _fileRepository.imageStream;

  Stream<XFile?> get photoStream => _fileRepository.photoStream;

  Future<void> getImage() async {
    return _fileRepository.getImage();
  }

  Future<void> capturePhoto() async {
    return _fileRepository.capturePhoto();
  }
}
