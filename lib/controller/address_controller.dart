import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constant/constant.dart';
import '../model/address_list_model.dart';

class AddressController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<AddressListModel> addressModel = AddressListModel().obs;
  RxList saveAsList = ['Home', 'Work', 'Hotel', 'other'].obs;
  RxString selectedSaveAs = 'Home'.obs;

  CameraPosition kLake = const CameraPosition(bearing: 192.8334901395799, target: LatLng(37.43296265331129, -122.08832357078792), tilt: 59.440717697143555, zoom: 14.151926040649414);
  Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    addMarkerSetup();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.addressListJson).then((value) {
      addressModel.value = AddressListModel.fromJson(value);
    });
    isLoading.value = false;
  }

  RxString saveAs = "My Self".obs;

  Rx<TextEditingController> addressTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> areaTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> landmarkTextFiledController = TextEditingController().obs;

  void handleGenderChange(String? value) {
    saveAs.value = value!;
  }

  BitmapDescriptor? locationMarker;

  addMarkerSetup() async {
    final Uint8List parking = await Constant.getBytesFromAsset("assets/images/ic_location_map_food.png", 300);
    locationMarker = BitmapDescriptor.fromBytes(parking);
    addMarker(id: "Current", descriptor: locationMarker!);
  }

  RxMap<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  addMarker({required String id, required BitmapDescriptor descriptor}) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      markerId: markerId,
      icon: descriptor,
      position: const LatLng(37.43296265331129, -122.08832357078792),
      rotation: 0.0,
      onTap: () {},
    );
    markers[markerId] = marker;
  }
}
