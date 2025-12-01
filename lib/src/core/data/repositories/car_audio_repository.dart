import 'package:t_rent/src/core/data/data_source/interfaces/i_car_audio_data_source.dart';
import 'package:t_rent/src/core/domain/interfaces/i_car_audio_repository.dart';

final class CarAudioRepository implements ICarAudioRepository {
  final ICarAudioDataSource _carAudioDataSource;

  CarAudioRepository(this._carAudioDataSource);

  @override
  Future<void> playRev({required String revAsset}) async {
    return _carAudioDataSource.playRev(
      revAsset: revAsset,
    );
  }

  @override
  Future<void> stopRev() async {
    return _carAudioDataSource.stopRev();
  }
}
