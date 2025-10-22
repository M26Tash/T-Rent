import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/support_methods/support_methods.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  late MapboxMap? _mapboxMap;
  late PointAnnotationManager? _annotationManager;
  OverlayEntry? _currentOverlay;

  final List<MockCar> _cars = MockCarList.cars;

  @override
  void initState() {
    super.initState();
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

  Future<void> _onMapCreated(MapboxMap mapboxMap) async {
    _mapboxMap = mapboxMap;

    _mapboxMap
      ?..attribution.updateSettings(
        AttributionSettings(
          enabled: false,
          clickable: false,
        ),
      )
      ..scaleBar.updateSettings(
        ScaleBarSettings(
          enabled: false,
        ),
      )
      ..logo.updateSettings(
        LogoSettings(
          marginLeft: AppDimensions.large,
          marginTop: AppDimensions.superLarge,
          position: OrnamentPosition.TOP_LEFT,
        ),
      )
      ..compass.updateSettings(
        CompassSettings(
          enabled: false,
        ),
      );

    await _mapboxMap!.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );

    await _mapboxMap!.setBounds(
      CameraBoundsOptions(
        bounds: CoordinateBounds(
          southwest: Point(
            coordinates: Position(26.0, 35.8),
          ),
          northeast: Point(
            coordinates: Position(45.0, 42.1),
          ),
          infiniteBounds: false,
        ),
        minZoom: 5,
        maxZoom: 18,
      ),
    );

    final position = await geo.Geolocator.getCurrentPosition();
    await _mapboxMap!.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            position.longitude,
            position.latitude,
          ),
        ),
        zoom: 14,
      ),
      MapAnimationOptions(duration: 1500),
    );

    _annotationManager =
        await _mapboxMap!.annotations.createPointAnnotationManager();

    final bytes = await rootBundle.load(AppAssets.carGpsMarker);

    final imageBytes = bytes.buffer.asUint8List();

    final carDataMap = <String, MockCar>{};

    for (final car in _cars) {
      final annotation =
          await _annotationManager!.create(PointAnnotationOptions(
        geometry: Point(
          coordinates: Position(
            car.coordinates.longitude,
            car.coordinates.latitude,
          ),
        ),
        image: imageBytes,
        iconSize: 0.4,
      ));

      carDataMap[annotation.id] = car;
    }

    _annotationManager?.setTextAllowOverlap(true);
    _annotationManager?.longPressEvents(
      onLongPress: (annotation) async {
        final car = carDataMap[annotation.id];
        if (car != null) {
          _currentOverlay?.remove();
          _currentOverlay = await SupportMethods.showCarOverlay(
            context: context,
            mapboxMap: mapboxMap,
            mockCar: car,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      textureView: false,
      onMapCreated: _onMapCreated,
    );
  }
}
