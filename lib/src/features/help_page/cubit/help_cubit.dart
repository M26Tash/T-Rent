import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit()
      : super(
          const HelpState(
            route: CustomizedRoute(null, null),
          ),
        );

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
