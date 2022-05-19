import 'package:attendencesystem/Model/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as la;
import '../API/API.dart';

class TrackUserController extends GetxController {
  List<String> sitelist = [];
  var dropdownValue = ''.obs;
  List<Marker> markers = [];
  var Loading = false.obs;
  var employeelist = [].obs;
  var center = new LatLng(33.652100, 75.123398).obs;
  GoogleMapController? controller;
  var initialCameraPosition = CameraPosition(
          zoom: 12,
          tilt: 0,
          bearing: 30,
          target: LatLng(24.9161647, 67.0653569))
      .obs;
  valueupdate(val) {
    dropdownValue.value = val;
    update();
  }

  mapupdate() async {
    // await CurrentLocation();

    // initialCameraPosition.value = CameraPosition(
    //   target: LatLng(double.parse(employeelist.value[0].location.split(',')[0]),
    //       double.parse(employeelist.value[0].location.split(',')[1])),
    //   zoom: 14,
    //   tilt: 1.0,
    //   bearing: 30,
    // );
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 14,
      tilt: 0,
      bearing: 30,
      target: LatLng(double.parse(employeelist.value[0].location.split(',')[0]),
          double.parse(employeelist.value[0].location.split(',')[1])),
    )));
    // showPinsOnMap(lat: lat, lng: lng);
    update();
  }

  getEmployee() async {
    Loading.value = true;
    employeelist.value.clear();
    var response = await API().GetEmployees();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await EmployeeModel.fromJson(response.data);
      employeelist.value = response.data;
      employeelist.value.forEach((element) {
        markers.add(
          Marker(
              icon: BitmapDescriptor.defaultMarker,
              markerId: MarkerId(element.name),
              position: LatLng(double.parse(element.location.split(',')[0]),
                  double.parse(element.location.split(',')[1])),
              infoWindow:
                  InfoWindow(title: element.name, snippet: element.empCode),
              onTap: () {}),
        );
        print(markers);
        print('asd');
      });

      for (var val in response.data) {
        sitelist.add(val.name.toString());

        sitelist.sort((a, b) {
          return a.toLowerCase().compareTo(b.toLowerCase());
        });
      }
      dropdownValue.value = sitelist.first;
      update();
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (sitelist.isEmpty) {
      mapupdate();
      getEmployee();
    }
  }
}
