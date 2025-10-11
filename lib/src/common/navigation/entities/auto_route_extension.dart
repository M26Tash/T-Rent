import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';

extension AutoRouterContextExtension on BuildContext {
  void navigateToRoute(CustomizedRoute route) {
    final router = AutoRouter.of(this);

    if (route.isPop()) {
      router.back();
    } else {
      final pageConfig = route.pageConfig;
      if (pageConfig != null) {
        if (route.shouldClearStack) {
          router.replaceAll([pageConfig]);
        } else {
          if (route.shouldReplace) {
            router.replace(pageConfig);
          } else {
            router.push(pageConfig);
          }
        }
      }
    }
  }
}
