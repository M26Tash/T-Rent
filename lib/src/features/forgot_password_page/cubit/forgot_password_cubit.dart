import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/core/domain/interactors/auth_interactor.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthInteractor _authInteractor;

  ForgotPasswordCubit(
    this._authInteractor,
  ) : super(
          const ForgotPasswordState(
            route: CustomizedRoute(
              null,
              null,
            ),
            currentPageIndex: 0,
            email: null,
            password: null,
          ),
        );

  void updateEmail(String email) {
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void updatePassword(String password) {
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  Future<void> resetPassword({required String email}) async {
    return _authInteractor.resetPassword(
      email: email,
    );
  }

  Future<void> verifyOtpAndPasswd({
    required String email,
    required String password,
    required String otpCode,
  }) async {
    return _authInteractor.verifyOtpAndPasswd(
      email: email,
      password: password,
      otpCode: otpCode,
    );
  }

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
