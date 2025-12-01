import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit()
      : super(
          const ForgotPasswordState(
            route: CustomizedRoute(
              null,
              null,
            ),
            currentPageIndex: 0,
          ),
        );

  void setPage(int page) {
    emit(
      state.copyWith(
        currentPageIndex: page,
      ),
    );
  }

  void nextPage() {
    if (state.currentPageIndex < 2) {
      emit(
        state.copyWith(
          currentPageIndex: state.currentPageIndex + 1,
        ),
      );
    }
  }

  void previousPage() {
    if (state.currentPageIndex > 0) {
      emit(
        state.copyWith(
          currentPageIndex: state.currentPageIndex - 1,
        ),
      );
    }
  }

  void resetFlow() {
    emit(
      state.copyWith(
        currentPageIndex: 0,
        route: const CustomizedRoute.pop(),
      ),
    );
  }

  void navigateBack() {
    emit(
      state.copyWith(
        route: const CustomizedRoute.pop(),
      ),
    );
  }
}
