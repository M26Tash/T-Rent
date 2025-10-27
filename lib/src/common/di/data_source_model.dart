import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/core/data/data_source/auth_data_soucre.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_auth_data_source.dart';

void initDataSource() {
  i.registerSingleton<IAuthDataSource>(
    AuthDataSource(),
  );
}
