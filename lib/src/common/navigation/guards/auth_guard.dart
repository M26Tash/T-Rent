import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authCubit = i.get<AuthCubit>();
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      router.replace(
        const MainRoute(),
      );
    }

    authCubit.stream.listen((event) {
      if (event.currentSession != null) {
        router.replace(
          const MainRoute(),
        );
      }
    });

    resolver.next();
  }
}
