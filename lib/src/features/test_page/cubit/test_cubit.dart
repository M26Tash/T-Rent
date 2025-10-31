import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/interactors/data_interactor.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final DataInteractor _dataInteractor;
  TestCubit(this._dataInteractor)
      : super(
          const TestState(
            route: CustomizedRoute(
              null,
              null,
            ),
          ),
        );

  Future<void> getCars() async {
    return _dataInteractor.getCars();
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
