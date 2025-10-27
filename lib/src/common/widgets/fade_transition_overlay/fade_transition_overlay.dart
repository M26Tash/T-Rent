import 'package:flutter/material.dart';

class FadeTransitionOverlay extends StatefulWidget {
  final Widget child;
  const FadeTransitionOverlay({
    required this.child,
    super.key,
  });

  @override
  State<FadeTransitionOverlay> createState() => _FadeTransitionOverlayState();
}

class _FadeTransitionOverlayState extends State<FadeTransitionOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    )..forward();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: widget.child,
    );
  }
}
