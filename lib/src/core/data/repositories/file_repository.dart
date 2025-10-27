import 'package:image_picker/image_picker.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_file_data_source.dart';
import 'package:t_rent/src/core/domain/interfaces/i_file_repository.dart';

final class FileRepository implements IFileRepository {
  final IFileDataSource _fileDataSource;

  const FileRepository(this._fileDataSource);

  @override
  Stream<XFile?> get imageStream => _fileDataSource.imageStream;

  @override
  Stream<XFile?> get photoStream => _fileDataSource.photoStream;

  @override
  Future<void> getImage() async {
    return _fileDataSource.getImage();
  }

  @override
  Future<void> capturePhoto() async {
    return _fileDataSource.capturePhoto();
  }
}
