import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/di/injector.dart';

final class CubitScope<T extends Cubit<dynamic>> extends StatelessWidget {
  static T of<T extends Cubit>(BuildContext context) => context.read<T>();

  final Widget child;
  final T? value;

  const CubitScope({
    required this.child,
    super.key,
  }) : value = null;

  const CubitScope.value({
    required this.value,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return BlocProvider<T>.value(
        value: value!,
        child: child,
      );
    }

    return BlocProvider<T>(
      create: (_) => i.get<T>(),
      child: child,
    );
  }
}
