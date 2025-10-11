import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

class CustomizedRoute extends Equatable {
  final TypeRoute? type;
  final PageRouteInfo? pageConfig;
  final bool shouldReplace;
  final bool shouldClearStack;

  @override
  List<Object?> get props => [
        type,
        pageConfig,
        shouldReplace,
        shouldClearStack,
      ];

  const CustomizedRoute(
    this.type,
    this.pageConfig, {
    this.shouldReplace = false,
    this.shouldClearStack = false,
  });

  const CustomizedRoute.pop() : this(TypeRoute.pop, null);

  bool isPop() => type == TypeRoute.pop;
}

enum TypeRoute { pop, navigateTo }
