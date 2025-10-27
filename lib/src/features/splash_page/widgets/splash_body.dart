import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';

class SplashBody extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onAnimationComplete;

  const SplashBody({
    required this.animationController,
    required this.onAnimationComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.carAnimationJson,
        controller: animationController,
        onLoaded: (composition) {
          animationController
            ..duration = composition.duration
            ..forward();

          Future.delayed(composition.duration).then(
            (value) => onAnimationComplete(),
          );
        },
      ),
    );
  }
}
