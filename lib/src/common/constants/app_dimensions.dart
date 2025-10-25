import 'package:flutter/material.dart';

abstract final class AppDimensions {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double preLarge = 12;
  static const double large = 16;
  static const double extraLarge = 32;
  static const double superLarge = 64;
  static const double extremeLarge = 128;

  // Other values
  static const double stepperHeight = 4;
  static const double pinputHeight = 60;
  static const double pinputWidth = 56;
  static const double smallAvatarRadius = 25;
  static const double bigAvatarRadius = 45;
  static const double panelNavigationIconSize = 30;
  static const double overlayWidth = 150;
  static const double overlayCarHeight = 60;
  static const double overlayCarWidth = 120;
  static const double specsListHeight = 150;
  static const double sliderHeight = 80;
}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
