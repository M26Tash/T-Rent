// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart' as geo;
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/main_page/cubits/route_cubit/route_cubit.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final RouteCubit _routeCubit = i.get<RouteCubit>();
  // late MapboxMap? _mapboxMap;
  // late PointAnnotationManager? _annotationManager;
  OverlayEntry? _currentOverlay;

  @override
  void initState() {
    super.initState();
    _routeCubit.getCars();
    _ensurePermissions();
  }

  // ! Remove to the appropriate file
  Future<void> _ensurePermissions() async {
    final serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    var permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }
  }

  // Future<void> _onMapCreated(MapboxMap mapboxMap, List<CarModel> cars) async {
  //   _mapboxMap = mapboxMap;

  //   _mapboxMap
  //     ?..attribution.updateSettings(
  //       AttributionSettings(
  //         enabled: false,
  //         clickable: false,
  //       ),
  //     )
  //     ..scaleBar.updateSettings(
  //       ScaleBarSettings(
  //         enabled: false,
  //       ),
  //     )
  //     ..logo.updateSettings(
  //       LogoSettings(
  //         marginLeft: AppDimensions.large,
  //         marginTop: AppDimensions.superLarge,
  //         position: OrnamentPosition.TOP_LEFT,
  //       ),
  //     )
  //     ..compass.updateSettings(
  //       CompassSettings(
  //         enabled: false,
  //       ),
  //     );

  //   await _mapboxMap!.location.updateSettings(
  //     LocationComponentSettings(
  //       enabled: true,
  //       pulsingEnabled: true,
  //     ),
  //   );

  //   await _mapboxMap!.setBounds(
  //     CameraBoundsOptions(
  //       bounds: CoordinateBounds(
  //         southwest: Point(
  //           coordinates: Position(26.0, 35.8),
  //         ),
  //         northeast: Point(
  //           coordinates: Position(45.0, 42.1),
  //         ),
  //         infiniteBounds: false,
  //       ),
  //       minZoom: 5,
  //       maxZoom: 18,
  //     ),
  //   );

  //   final position = await geo.Geolocator.getCurrentPosition();
  //   await _mapboxMap!.flyTo(
  //     CameraOptions(
  //       center: Point(
  //         coordinates: Position(
  //           position.longitude,
  //           position.latitude,
  //         ),
  //       ),
  //       zoom: 14,
  //     ),
  //     MapAnimationOptions(duration: 1500),
  //   );

  //   _annotationManager =
  //       await _mapboxMap!.annotations.createPointAnnotationManager();

  //   final bytes = await rootBundle.load(AppAssets.carGpsMarker);

  //   final imageBytes = bytes.buffer.asUint8List();

  //   final carDataMap = <String, CarModel>{};

  //   for (final car in cars) {
  //     final annotation =
  //         await _annotationManager!.create(PointAnnotationOptions(
  //       geometry: Point(
  //         coordinates: Position(
  //           car.carCoordinates.longitude,
  //           car.carCoordinates.latitude,
  //         ),
  //       ),
  //       image: imageBytes,
  //       iconSize: 0.4,
  //     ),);

  //     carDataMap[annotation.id] = car;
  //   }

  //   _annotationManager?.setTextAllowOverlap(true);
  //   _annotationManager?.longPressEvents(
  //     onLongPress: (annotation) async {
  //       final car = carDataMap[annotation.id];
  //       if (car != null) {
  //         _currentOverlay?.remove();
  //         _currentOverlay = await SupportMethods.showCarOverlay(
  //           context: context,
  //           mapboxMap: mapboxMap,
  //           car: car,
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CubitScope<RouteCubit>(
      child: BlocBuilder<RouteCubit, RouteState>(
        builder: (context, state) {
          final routeCubit = CubitScope.of<RouteCubit>(context);

          // if (state.cars == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
              ),
            );
          // }

          // return MapWidget(
          //   textureView: false,
          //   onMapCreated: (controller) => _onMapCreated(
          //     controller,
          //     state.cars!,
          //   ),
          // );
        },
      ),
    );
  }
}
