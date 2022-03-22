import 'package:get/get.dart';

import '../API/BaseURl.dart';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  var name;
  var center = new LatLng(33.652100, 75.123398).obs;
  ScanResult? scanResult;
  var sites = "".obs;
  var Loading = false.obs;
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  // var valcheck = ''.obs;

  CurrentLocation() async {
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
      sites.value = scanResult!.rawContent;
      if (sites.value != "") {
        BaseUrl.storage.read("status") == false ? clockin() : clockout();
        // Get.toNamed('/attendance');
      } else {
        Loading.value = false;
        Get.snackbar("Attendance", "Location is empty kindly scan again",
            colorText: Colors.white, backgroundColor: Colors.red);
      }

      update();
    } on PlatformException catch (e) {
      Get.snackbar("Error ", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
      Loading.value = false;
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
    Loading.value = true;
    update();
    var date = DateTime.now();

    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    var outputDate = outputFormat.format(date);

    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    await CurrentLocation();
    var status = await Permission.location.status;
    if (status.isGranted) {
      await CurrentLocation();

      if (sites.value != "") {
        var response = await API().CheckIn(
            latlng: center.value.latitude.toString() +
                "," +
                center.value.longitude.toString(),
            siteId: sites.value.toString(),
            date: outputDate);
        if (response.statusCode == 200) {
          var resp = await API().AbsentPresent();
          if (resp.statusCode == 200) {
            print('bilal');
            BaseUrl.storage
                .write("totalPresent", resp.data['present_days'].toString());
            BaseUrl.storage
                .write("totalAbsent", resp.data['absent_days'].toString());
          }
          BaseUrl.storage.write("clockout", "00:00");
          Loading.value = false;
          BaseUrl.clockin = outputDate1.toString();

          BaseUrl.storage.write("status", true);
          BaseUrl.storage.write("clockin", BaseUrl.clockin);

          // Get.back();
          Get.snackbar("Attendance", "Clock In Successfully");
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
    } else {
      Loading.value = false;
      Get.snackbar("Error ",
          'The user did not grant the location permission!'.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  clockout() async {
    Loading.value = true;
    update();
    var date = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);

    await CurrentLocation();
    if (sites.value != "") {
      var response = await API().CheckOut(
          latlng: center.value.latitude.toString() +
              "," +
              center.value.longitude.toString(),
          siteId: sites.value.toString(),
          date: outputDate);
      if (response.statusCode == 200) {
        print('bilal');
        BaseUrl.storage.write("status", false);
        Loading.value = false;
        BaseUrl.clockout = outputDate1.toString();
        BaseUrl.storage.write("clockout", BaseUrl.clockout);
        //print(response);

        // Get.back();
        Get.snackbar(
          "Attendance ",
          "Clock Out Successfully",
        );
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
    current.value =
        months[selectedmonth.value - 1] + "-" + selectedyear.value.toString();
    var nam = BaseUrl.storage.read('name').toString().split(' ');
    name = nam[0].toString();
  }
}
