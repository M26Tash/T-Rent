import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit()
      : super(
          const RouteState(
            route: CustomizedRoute(
              null,
              null,
            ),
          ),
        );

  // ignore: unused_element
  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomizedRoute(null, null),
      ),
    );
  }
}
