import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';
import 'package:t_rent/src/core/domain/interactors/file_interactor.dart';

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
    );
}
