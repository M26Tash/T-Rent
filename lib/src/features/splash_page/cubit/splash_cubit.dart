// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/navigation/route.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  AnimationController? _animationController;
  Timer? _navigationTimer;

  SplashCubit()
      : super(
          const SplashState(
            route: CustomizedRoute(null, null),
          ),
        );

  @override
  Future<void> close() {
    _animationController?.dispose();
    _navigationTimer?.cancel();

    return super.close();
  }

  void initAnimation(AnimationController controller, Size screenSize) {
    _animationController = controller;

    controller
      ..addListener(() {
        final animatedPosition = 0.0 + (controller.value * 1.1);

        final progress = controller.value;
        final backgroundColor = progress > 0.8
            ? Color.lerp(
                  const Color(0xFF660708),
                  const Color(0xFFF5F5F5),
                  (progress - 0.8) * 5,
                ) ??
                const Color(0xFF660708)
            : const Color(0xFF660708);

        final buttonY = screenSize.height * (1.0 - animatedPosition);
        final updatedTrace = List<Offset>.from(state.tracePoints);

        if (progress > 0 && progress < 1.0) {
          updatedTrace.add(Offset(screenSize.width / 2, buttonY + 40));
        }

        emit(
          state.copyWith(
            buttonPosition: animatedPosition,
            backgroundColor: backgroundColor,
            tracePoints: updatedTrace,
          ),
        );
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            emit(
              state.copyWith(
                route: const CustomizedRoute(
                  TypeRoute.navigateTo,
                  AuthRoute(),
                ),
              ),
            );
          }
        },
      );
  }
}
