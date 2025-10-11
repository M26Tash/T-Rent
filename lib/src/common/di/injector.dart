import 'package:get_it/get_it.dart';
import 'package:t_rent/src/common/di/cubit_module.dart';
import 'package:t_rent/src/common/di/data_source_model.dart';
import 'package:t_rent/src/common/di/interactors_module.dart';
import 'package:t_rent/src/common/di/repositories_module.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initDataSource();
  initRepositories();
  initInteractors();
  initSharedCubits();
  initCubits();
}
