import 'package:attendencesystem/API/API.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AttendanceController extends GetxController {
  var center = new LatLng(33.652100, 75.123398).obs;
  CurrentLocation() async {
    final location = new Location();
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    location.onLocationChanged.listen((LocationData cLoc) {
      center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
    });
  }

  void clockin() async {
    await CurrentLocation();
    var response = await API().CheckIn(
      latlng: center.value.latitude.toString() +
          "," +
          center.value.longitude.toString(),
      siteId: "123",
    );
    if (response.statusCode == 200) {
      print(response);
      Get.snackbar("Registration ", "Register Successfully");
      Get.toNamed('/home');
    }
  }

  clockout() async {
    await CurrentLocation();
    var response = await API().CheckOut(
      latlng: center.value.latitude.toString() +
          "," +
          center.value.longitude.toString(),
      siteId: "123",
    );
    if (response.statusCode == 200) {
      print(response);
      Get.snackbar("Registration ", "Register Successfully");
      Get.toNamed('/home');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
