import 'package:attendencesystem/API/API.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AttendanceController extends GetxController {
  var center = new LatLng(33.652100, 75.123398).obs;
  ScanResult? scanResult;
  var sites = "".obs;
  var Loading = false.obs;
  CurrentLocation() async {
    Loading.value = true;
    final location = new Location();
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    location.onLocationChanged.listen((LocationData cLoc) {
      center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
    });
    update();
  }

  Future<void> scan() async {
    try {
      final result = await BarcodeScanner.scan();
      scanResult = result;
      print(scanResult!.rawContent);
      print("scanResult");
      sites.value = scanResult!.rawContent;
      if (sites.value != "") {
        Get.toNamed('/attendance');
      } else {
        Get.snackbar("Attendance", "Location is empty kindly scan Qr again");
      }

      update();
    } on PlatformException catch (e) {
      scanResult = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'The user did not grant the camera permission!'
            : 'Unknown error: $e',
      );
      update();
    }
  }

  void clockin() async {
    await CurrentLocation();
    if (sites.value != "") {
      var response = await API().CheckIn(
        latlng: center.value.latitude.toString() +
            "," +
            center.value.longitude.toString(),
        siteId: "123",
      );
      if (response.statusCode == 200) {
        Loading.value = false;
        print(response);
        Get.snackbar("Attendance", "Clock Out Successfully");
        Get.toNamed('/home');
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error", "Location is empty kindly scan Qr",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  clockout() async {
    await CurrentLocation();
    if (sites.value != "") {
      var response = await API().CheckOut(
        latlng: center.value.latitude.toString() +
            "," +
            center.value.longitude.toString(),
        siteId: "123",
      );
      if (response.statusCode == 200) {
        Loading.value = false;
        print(response);
        Get.snackbar("Attendance ", "Clock Out Successfully");
        Get.toNamed('/home');
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error", "Location is empty kindly scan Qr",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}