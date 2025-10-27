import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/core/data/repositories/auth_repository.dart';
import 'package:t_rent/src/core/domain/interfaces/i_auth_repository.dart';

void initRepositories() {
  i.registerSingleton<IAuthRepository>(
    AuthRepository(
      i.get(),
    ),
  );
}
