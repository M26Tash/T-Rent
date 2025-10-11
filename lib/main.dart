import 'package:flutter/material.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/features/app/page/app.dart';

void main() {
  injectDependencies();

  runApp(
    const App(),
  );
}
