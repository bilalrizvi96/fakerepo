import 'dart:io';
import 'dart:typed_data';

import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/API/Capitalize.dart';
import 'package:attendencesystem/Model/EmployeeModel.dart';
import 'package:attendencesystem/Model/HistoryCheckpointModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
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
  var connection = true.obs;
  init() {
    staafflist = [];
    dropdownValue.value = "Show All Staff";

    getEmployee();
  }

  @override
  void onInit() {
    super.onInit();
    check();
    // init();
  }

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;
        update();
      }
    } on SocketException catch (_) {
      connection.value = false;
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        Loading.value = false;
        connection.value = true;
        update();
      } else {
        connection.value = false;
        update();
      }
    });
  }

  valueupdate(val) {
    dropdownValue.value = val;
    if (dropdownValue.value == "Show All Staff") {
      getEmployee();
    } else {
      employeedata.value.forEach((element) {
        if (dropdownValue.value == element.name.toString().toTitleCase()) {
          getspecificEmployee(
              element.empCode, element.name.toString().toTitleCase());
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

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
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

  empmapupdate(lat, lng, zoom) async {
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: zoom,
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
                    Loading.value = true;
                    update();
                    dropdownValue.value = element.name.toString().toTitleCase();
                    getspecificEmployee(
                        element.empCode, element.name.toString().toTitleCase());
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
        update();
        print(markers);
        print('asd');
      });
      staafflist.add('Show All Staff');
      for (var val in response.data) {
        staafflist.add(val.name.toString().toTitleCase());
      }
      Loading.value = false;
      update();
    } else {
      Loading.value = false;

      // Get.snackbar("Error ", response.data['error'].toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  getspecificEmployee(var empcode, var name) async {
    Loading.value = true;
    employeelist.value.clear();
    markers.clear();
    BaseUrl.storage.write('specificemp', empcode);
    BaseUrl.storage.write('specificempname', name);

    var date = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd'T'00:mm:ss'");
    var outputDate = outputFormat.format(date);

    var response = await API().HistoryCheckPoints(
        require: 'checkPoints', date: outputDate, empcode: empcode);
    if (response.statusCode == 200) {
      response = await HistoryCheckpointModel.fromJson(response.data);
      employeelist.value = response.data[0].checkPoints;
      final Uint8List c_markerIcon =
          await getBytesFromAssets('assets/currentmarker.png', 100);
      final Uint8List a_markerIcon =
          await getBytesFromAssets('assets/allpointmarker.png', 100);

      employeelist.value.forEach((element) async {
        markers.add(
          Marker(
              icon: element == employeelist.value.last
                  ? BitmapDescriptor.fromBytes(c_markerIcon)
                  : BitmapDescriptor.fromBytes(a_markerIcon),
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
                            CachedNetworkImage(
                              imageUrl: element.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image_not_supported_outlined),
                            )
                            // Image.network(element.image, fit: BoxFit.cover)
                          ],
                        ),
                        radius: 10.0);
                  }),
              onTap: () {
                zoom.value = 22.0;
                empmapupdate(
                    double.parse(element.location.split(',')[0]),
                    double.parse(element.location.split(',')[1]),
                    zoom.value = 22.0);
              }),
        );
        Loading.value = false;

        // Empmapupdate();
        print(markers);
        print('asd');
      });

      // dropdownValue.value = sitelist.first;
      update();
    } else {
      Loading.value = false;
      Get.snackbar("Track User ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // this.dispose();
  }
}
