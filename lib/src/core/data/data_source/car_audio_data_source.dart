// import 'package:just_audio/just_audio.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_car_audio_data_source.dart';
import 'package:t_rent/src/core/domain/utils/core_logger.dart';

class CarAudioDataSource implements ICarAudioDataSource {
  // final AudioPlayer _player = AudioPlayer();
  // bool _isRevving = false;

  @override
  Future<void> playRev({
    required String revAsset,
  }) async {
    try {
      // if (_isRevving) {
      //   await _player.seek(const Duration(seconds: 2));
      //   await _player.play();
      //   return;
      // }

      // _isRevving = true;
      // await _player.setUrl(revAsset);
      // await _player.play();

      // _player.playerStateStream.listen((state) async {
      // if (state.processingState == ProcessingState.completed && _isRevving) {
      //     await _player.setLoopMode(LoopMode.one);
      //     await _player.seek(
      //       const Duration(
      //         seconds: 2,
      //       ),
      //     );
      //     await _player.play();
      //   }
      // });
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
    // } on PlayerException catch (e) {
      CoreLogger.errorLog(
        'playRev()',
        params: {'Error playing rev': e},
      );
    }
  }

  @override
  Future<void> stopRev() async {
    try {
    //   _isRevving = false;

    //   for (double v = 1; v >= 0; v -= 0.1) {
    //     await _player.setVolume(v);
    //     await Future.delayed(
    //       const Duration(
    //         milliseconds: 50,
    //       ),
    //     );
    //   }

    //   await _player.stop();
    //   await _player.setVolume(1);
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
    // } on PlayerException catch (e) {
      CoreLogger.errorLog(
        'stopRev()',
        params: {'Error stopping rev': e},
      );
    }
  }
}
