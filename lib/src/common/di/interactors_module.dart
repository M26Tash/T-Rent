import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/car_audio_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/file_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/local_data_interactor.dart';

void initInteractors() {
  i
    ..registerSingleton<AuthInteractor>(
      AuthInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<FileInteractor>(
      FileInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<DataInteractor>(
      DataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<LocalDataInteractor>(
      LocalDataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<CarAudioInteractor>(
      CarAudioInteractor(
        i.get(),
      ),
    );
}
