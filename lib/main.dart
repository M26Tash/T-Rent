import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/features/app/page/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injectDependencies();

  await dotenv.load();

  final accessToken = dotenv.get('ACCESSTOKEN');

  MapboxOptions.setAccessToken(accessToken);

  runApp(
    const App(),
  );
}
