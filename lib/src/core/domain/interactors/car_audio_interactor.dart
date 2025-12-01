import 'package:t_rent/src/core/domain/interfaces/i_car_audio_repository.dart';

final class CarAudioInteractor {
  final ICarAudioRepository _carAudioRepository;

  CarAudioInteractor(this._carAudioRepository);

  Future<void> playRev({required String revAsset}) async {
    return _carAudioRepository.playRev(
      revAsset: revAsset,
    );
  }

  Future<void> stopRev() async {
    return _carAudioRepository.stopRev();
  }
}
