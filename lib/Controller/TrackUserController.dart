import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackUserController extends GetxController {
  List<String> sitelist = [];
  var dropdownValue = ''.obs;
  var markers = Set<Marker>().obs;
  GoogleMapController? controller;
  var initialCameraPosition = CameraPosition(
          zoom: 20,
          tilt: 0,
          bearing: 30,
          target: LatLng(24.9161647, 67.0653569))
      .obs;
  valueupdate(val) {
    dropdownValue.value = val;
    update();
  }
}
