import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dgis_mobile_sdk_full/dgis.dart' as sdk;
import 'package:permission_handler/permission_handler.dart';

Future<void> checkLocationPermissions(
  sdk.LocationService locationService,
) async {
  final permission = await Permission.location.request();
  if (permission.isGranted) {
    locationService.onPermissionGranted();
  }
}

Text buildPageTitle(String content) {
  return Text(
    content,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
  );
}

ListTile buildListTile(BuildContext context, String title, String subtitle) {
  return ListTile(
    title: buildPageTitle(title),
    subtitle: Text(subtitle),
  );
}

// SDK is initialized here. If you need to modify parameters of initialization,
// do it in initializeSdk() method.
class AppContainer {
  static sdk.Context? _sdkContext;

  sdk.Context initializeSdk() {
    _sdkContext ??= sdk.DGis.initialize(
      logOptions: const sdk.LogOptions(
        systemLevel: sdk.LogLevel.verbose,
        customLevel: sdk.LogLevel.verbose,
      ),
      locationProvider: _LocationProviderImpl()
    );
    return _sdkContext!;
  }
}


class _LocationProviderImpl implements sdk.LocationProvider {
  sdk.Location? _location;
  sdk.LocationNotifier? _locationNotifier;

  final _testLocations = [
    (const sdk.Location(
      coordinates: sdk.LocationCoordinates(
        value: sdk.GeoPoint(
          latitude: sdk.Latitude(55.759909),
          longitude: sdk.Longitude(37.618806),
        ),
        accuracy: 15,
      ),
      altitude: null,
      course: sdk.LocationCourse(
        value: sdk.Bearing(20),
        accuracy: sdk.Bearing(5),
      ),
      groundSpeed: null,
      timestamp: Duration.zero,
    )),
    (const sdk.Location(
      coordinates: sdk.LocationCoordinates(
        value: sdk.GeoPoint(
          latitude: sdk.Latitude(55.746962),
          longitude: sdk.Longitude(37.643073),
        ),
        accuracy: 5,
      ),
      altitude: null,
      course: sdk.LocationCourse(
        value: sdk.Bearing(10),
        accuracy: sdk.Bearing(5),
      ),
      groundSpeed: null,
      timestamp: Duration(seconds: 10),
    )),
  ];

  @override
  sdk.Location? lastLocation() {
    return _location;
  }

  @override
  void setNotifiers(
    sdk.LocationNotifier? locationNotifier,
    sdk.LocationAvailableNotifier? availableNotifier,
  ) {
    _locationNotifier = locationNotifier;
    _location = _testLocations[0];
    _locationNotifier?.send([_testLocations[0]]);
    availableNotifier?.send(true);
    Future.delayed(const Duration(seconds: 10), () {
      _location = _testLocations[1];
      _locationNotifier?.send([_testLocations[1]]);
    });
  }

  @override
  void setDesiredAccuracy(sdk.DesiredAccuracy desiredAccuracy) {}
}
