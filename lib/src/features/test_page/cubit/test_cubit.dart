import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit()
      : super(
          const TestState(
            route: CustomizedRoute(
              null,
              null,
            ),
          ),
        );
}
