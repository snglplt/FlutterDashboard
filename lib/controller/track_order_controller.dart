import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackOrderController extends GetxController {
  CameraPosition kLake = const CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 14.151926040649414);
  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
}
