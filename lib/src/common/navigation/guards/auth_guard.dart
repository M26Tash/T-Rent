import 'package:auto_route/auto_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_rent/src/common/navigation/route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      final String? fullName = session.user.userMetadata?['full_name'];

      if (fullName == null || fullName.isEmpty) {
        resolver.redirectUntil(UserDetailsRoute(
          email: session.user.email ?? '',
          fullName: '',
        ),);
      } else {
        resolver.redirectUntil(const MainRoute());
      }
    } else {
      resolver.next();
    }
  }
}
