import 'dart:typed_data';

import 'package:attendencesystem/API/Capitalize.dart';
import 'package:attendencesystem/Model/EmployeeModel.dart';
import 'package:attendencesystem/Model/HistoryCheckpointModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../API/API.dart';
import 'dart:ui' as ui;

class TrackUserController extends GetxController {
  List<String> staafflist = [];
  var dropdownValue = 'Show All Staff'.obs;
  List<Marker> markers = [];
  var zoom = 18.0.obs;
  var Loading = false.obs;
  var employeelist = [].obs;
  var employeedata = [].obs;
  GoogleMapController? controller;
  var initialCameraPosition = CameraPosition(
          zoom: 11.0,
          tilt: 5,
          bearing: 30,
          target: LatLng(24.9161647, 67.0653569))
      .obs;
  valueupdate(val) {
    dropdownValue.value = val;
    if (dropdownValue.value == "Show All Staff") {
      getEmployee();
    } else {
      employeedata.value.forEach((element) {
        if (dropdownValue.value == element.name.toString().toTitleCase()) {
          getspecificEmployee(element.empCode);
        }
      });
      update();
    }
    update();
  }

  Future<Uint8List> getBytesFromAsset(ByteData path, int width) async {
    // ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(path.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  mapupdate(zoom, lat, lng) async {
    controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: zoom,
      tilt: 0,
      bearing: 30,
      target: employeedata.value.isNotEmpty
          ? LatLng(lat, lng)
          : LatLng(33.652100, 75.123398),
    )));
    update();
  }

  Empmapupdate(lat, lng) async {
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 20,
      tilt: 0,
      bearing: 30,
      target: LatLng(lat, lng),
    )));
    update();
  }

  getEmployee() async {
    // staafflist = [];
    Loading.value = true;
    // markers = [];
    staafflist.clear();
    markers.clear();
    employeedata.value.clear();

    var response = await API().GetEmployees();
    if (response.statusCode == 200) {
      response = await EmployeeModel.fromJson(response.data);
      employeedata.value = response.data;

      employeedata.value.forEach((element) async {
        var iconurl = "https://ik.imagekit.io/64vfjnxvf/" +
            element.empCode.toString() +
            '.jpg?tr=r-800,c-500,g-500';

        var dataBytes;
        var request = await http.get(Uri.parse(iconurl));
        var bytes = await request.bodyBytes;
        dataBytes = bytes;

        ui.Codec codec = await ui.instantiateImageCodec(
            dataBytes.buffer.asUint8List(),
            targetWidth: 80);
        ui.FrameInfo fi = await codec.getNextFrame();

        final Uint8List markerIcon =
            (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
                .buffer
                .asUint8List();
        var mark = markerIcon;
        Loading.value = true;
        markers.add(
          Marker(
              icon: BitmapDescriptor.fromBytes(mark),
              markerId: MarkerId(element.name),
              position: LatLng(double.parse(element.location.split(',')[0]),
                  double.parse(element.location.split(',')[1])),
              infoWindow: InfoWindow(
                  title: element.name.toString().toTitleCase(),
                  snippet: element.empCode,
                  onTap: () async {
                    dropdownValue.value = element.name.toString().toTitleCase();
                    await getspecificEmployee(element.empCode);
                  }),
              onTap: () {
                zoom.value = 22.0;
                mapupdate(
                    zoom.value,
                    double.parse(element.location.split(',')[0]),
                    double.parse(element.location.split(',')[1]));
              }),
        );
        Loading.value = false;

        print(markers);
        print('asd');
      });
      staafflist.add('Show All Staff');
      for (var val in response.data) {
        staafflist.add(val.name.toString().toTitleCase());
      }
      update();
    } else {
      Loading.value = false;

      // Get.snackbar("Error ", response.data['error'].toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  getspecificEmployee(var empcode) async {
    Loading.value = true;
    employeelist.value.clear();
    markers.clear();
    // markers = [];
    // staafflist.clear();
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
              icon: BitmapDescriptor.defaultMarker,
              markerId: MarkerId(element.siteName),
              position: LatLng(double.parse(element.location.split(',')[0]),
                  double.parse(element.location.split(',')[1])),
              infoWindow: InfoWindow(
                  title: element.siteName.toString().toTitleCase(),
                  snippet: element.time,
                  onTap: () {
                    Get.defaultDialog(
                        title: '',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.clear)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  element.siteName.toString().toTitleCase(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                Spacer(),
                                Text(
                                  element.time,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image.network(element.image, fit: BoxFit.cover)
                          ],
                        ),
                        radius: 10.0);
                    // showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (_) => AlertDialog(
                    //           actions: [
                    //             Center(
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: GestureDetector(
                    //                     onTap: () {
                    //                       Get.back();
                    //                     },
                    //                     child: Icon(Icons.clear)),
                    //               ),
                    //             ),
                    //             Image.network(
                    //                 faqsController
                    //                     .supportrequestlist.value[index].image,
                    //                 fit: BoxFit.cover)
                    //           ],
                    //         ));
                  }),
              onTap: () {
                Empmapupdate(double.parse(element.location.split(',')[0]),
                    double.parse(element.location.split(',')[1]));
              }),
        );
        // Empmapupdate();
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
    update();
  }

  init() {
    staafflist = [];
    dropdownValue.value = "Show All Staff";
    getEmployee();
  }

  @override
  void onInit() {
    super.onInit();
    // init();
  }
}
