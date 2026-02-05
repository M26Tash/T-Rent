// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

/// generated route for
/// [AboutUsPage]
class AboutUsRoute extends PageRouteInfo<void> {
  const AboutUsRoute({List<PageRouteInfo>? children})
      : super(AboutUsRoute.name, initialChildren: children);

  static const String name = 'AboutUsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutUsPage();
    },
  );
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [BookingPage]
class BookingRoute extends PageRouteInfo<BookingRouteArgs> {
  BookingRoute({required CarModel car, Key? key, List<PageRouteInfo>? children})
      : super(
          BookingRoute.name,
          args: BookingRouteArgs(car: car, key: key),
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingRouteArgs>();
      return BookingPage(car: args.car, key: args.key);
    },
  );
}

class BookingRouteArgs {
  const BookingRouteArgs({required this.car, this.key});

  final CarModel car;

  final Key? key;

  @override
  String toString() {
    return 'BookingRouteArgs{car: $car, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingRouteArgs) return false;
    return car == other.car && key == other.key;
  }

  @override
  int get hashCode => car.hashCode ^ key.hashCode;
}

/// generated route for
/// [CarDetailsPage]
class CarDetailsRoute extends PageRouteInfo<CarDetailsRouteArgs> {
  CarDetailsRoute({
    required CarModel car,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CarDetailsRoute.name,
          args: CarDetailsRouteArgs(car: car, key: key),
          initialChildren: children,
        );

  static const String name = 'CarDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CarDetailsRouteArgs>();
      return CarDetailsPage(car: args.car, key: args.key);
    },
  );
}

class CarDetailsRouteArgs {
  const CarDetailsRouteArgs({required this.car, this.key});

  final CarModel car;

  final Key? key;

  @override
  String toString() {
    return 'CarDetailsRouteArgs{car: $car, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CarDetailsRouteArgs) return false;
    return car == other.car && key == other.key;
  }

  @override
  int get hashCode => car.hashCode ^ key.hashCode;
}

/// generated route for
/// [ConfirmationPage]
class ConfirmationRoute extends PageRouteInfo<void> {
  const ConfirmationRoute({List<PageRouteInfo>? children})
      : super(ConfirmationRoute.name, initialChildren: children);

  static const String name = 'ConfirmationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConfirmationPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HelpPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [MyAccountPage]
class MyAccountRoute extends PageRouteInfo<void> {
  const MyAccountRoute({List<PageRouteInfo>? children})
      : super(MyAccountRoute.name, initialChildren: children);

  static const String name = 'MyAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyAccountPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [TestPage]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute({List<PageRouteInfo>? children})
      : super(TestRoute.name, initialChildren: children);

  static const String name = 'TestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestPage();
    },
  );
}

/// generated route for
/// [UserDetailsPage]
class UserDetailsRoute extends PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({
    required String email,
    required String fullName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UserDetailsRoute.name,
          args:
              UserDetailsRouteArgs(email: email, fullName: fullName, key: key),
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserDetailsRouteArgs>();
      return UserDetailsPage(
        email: args.email,
        fullName: args.fullName,
        key: args.key,
      );
    },
  );
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({
    required this.email,
    required this.fullName,
    this.key,
  });

  final String email;

  final String fullName;

  final Key? key;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{email: $email, fullName: $fullName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserDetailsRouteArgs) return false;
    return email == other.email &&
        fullName == other.fullName &&
        key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ fullName.hashCode ^ key.hashCode;
}
