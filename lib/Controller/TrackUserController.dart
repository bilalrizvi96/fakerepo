import 'package:attendencesystem/Model/EmployeeModel.dart';
import 'package:attendencesystem/Model/HistoryCheckpointModel.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as la;
import '../API/API.dart';

class TrackUserController extends GetxController {
  List<String> sitelist = [];
  var dropdownValue = 'Please Select User'.obs;
  List<Marker> markers = [];
  var Loading = false.obs;
  var employeelist = [].obs;
  var employeedata = [].obs;
  GoogleMapController? controller;
  var initialCameraPosition = CameraPosition(
          zoom: 9, tilt: 0, bearing: 30, target: LatLng(24.9161647, 67.0653569))
      .obs;
  valueupdate(val) {
    dropdownValue.value = val;
    if (dropdownValue.value == "Please Select User") {
      getEmployee();
    } else {
      employeedata.value.forEach((element) {
        if (dropdownValue.value == element.name) {
          getspecificEmployee(element.empCode);
        }
      });
    }
    update();
  }

  mapupdate() async {
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 11,
      tilt: 0,
      bearing: 30,
      target: LatLng(double.parse(employeelist.value[0].location.split(',')[0]),
          double.parse(employeelist.value[0].location.split(',')[1])),
    )));
    update();
  }

  Empmapupdate() async {
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 18,
      tilt: 2,
      bearing: 30,
      target: LatLng(double.parse(employeelist.value[0].location.split(',')[0]),
          double.parse(employeelist.value[0].location.split(',')[1])),
    )));
    update();
  }

  getEmployee() async {
    Loading.value = true;
    sitelist.clear();
    employeedata.value.clear();
    markers.clear();
    var response = await API().GetEmployees();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await EmployeeModel.fromJson(response.data);
      employeedata.value = response.data;
      sitelist.add('Please Select User');
      for (var val in response.data) {
        sitelist.add(val.name.toString());
      }
      employeedata.value.forEach((element) {
        markers.add(
          Marker(
              icon: BitmapDescriptor.defaultMarker,
              markerId: MarkerId(element.name),
              position: LatLng(double.parse(element.location.split(',')[0]),
                  double.parse(element.location.split(',')[1])),
              infoWindow:
                  InfoWindow(title: element.name, snippet: element.empCode),
              onTap: () {
                dropdownValue.value = element.name;
                getspecificEmployee(element.empCode);
              }),
        );
        mapupdate();
        print(markers);
        print('asd');
      });

      // dropdownValue.value = sitelist.first;
      update();
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  getspecificEmployee(var empcode) async {
    Loading.value = true;
    employeelist.value.clear();
    markers.clear();
    var date = DateTime.now();
    var outputFormat = DateFormat("dd-MM-yyyy");
    var outputDate = outputFormat.format(date);

    var response = await API().HistoryCheckPoints(
        require: 'checkPoints', date: outputDate, empcode: empcode);
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await HistoryCheckpointModel.fromJson(response.data);
      employeelist.value = response.data[0].checkPoints;
      employeelist.value.forEach((element) {
        markers.add(
          Marker(
              icon:
                  // element.siteName == 'Current Location'
                  //     ?
                  BitmapDescriptor.defaultMarker,
              // : BitmapDescriptor.defaultMarkerWithHue(
              //     BitmapDescriptor.hueCyan),
              markerId: MarkerId(element.siteName),
              position: LatLng(double.parse(element.location.split(',')[0]),
                  double.parse(element.location.split(',')[1])),
              infoWindow: InfoWindow(
                title: element.siteName,
              ),
              onTap: () {}),
        );
        Empmapupdate();
        print(markers);
        print('asd');
      });

      // dropdownValue.value = sitelist.first;
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
      getEmployee();
    }
  }
}
