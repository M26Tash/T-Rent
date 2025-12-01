import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/core/data/data_source/auth_data_soucre.dart';
import 'package:t_rent/src/core/data/data_source/car_audio_data_source.dart';
import 'package:t_rent/src/core/data/data_source/data_source.dart';
import 'package:t_rent/src/core/data/data_source/file_data_source.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_car_audio_data_source.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_file_data_source.dart';
import 'package:t_rent/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:t_rent/src/core/data/data_source/local_data_source.dart';

void initDataSource() {
  i
    ..registerSingleton<IAuthDataSource>(
      AuthDataSource(),
    )
    ..registerSingleton<IFileDataSource>(
      FileDataSource(),
    )
    ..registerSingleton<IDataSource>(
      DataSource(),
    )
    ..registerSingleton<ILocalDataSource>(
      LocalDataSource(),
    )
    ..registerSingleton<ICarAudioDataSource>(
      CarAudioDataSource(),
    );
}
