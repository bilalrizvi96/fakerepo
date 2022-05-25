import 'dart:convert';
import 'dart:io';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as la;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
import '../API/API.dart';
import '../API/BaseURl.dart';
import '../Model/HistoryCheckpointModel.dart';
import '../View/HomeScreen/HomeScreen.dart';
import 'HomeController.dart';

class CheckPointController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  final ImagePicker _picker = ImagePicker();
  XFile? checkpointImage;
  var first = ''.obs;
  var finaldate = ''.obs;

  TabController? tabController;
  var searchhistorylist = [].obs;
  var mainhistorylist = [].obs;
  var checkboxvalue = false.obs;
  var checkpointFormKey = GlobalKey<FormState>();
  var todate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var siteController = TextEditingController();
  var noteController = TextEditingController();
  var center = new LatLng(33.652100, 75.123398).obs;
  var Loading = false.obs;
  GoogleMapController? controller;
  var day, month, year;
  var initialCameraPosition = CameraPosition(
          zoom: 20,
          tilt: 0,
          bearing: 30,
          target: LatLng(24.9161647, 67.0653569))
      .obs;
  var markers = Set<Marker>().obs;
  var historymarkers = Set<Marker>().obs;
  final colors = [DynamicColor().primarycolor, DynamicColor().primarycolor];
  Color? indicatorColor;
  var historyList = [].obs;
  var clockindate2, check;
  var connection = true.obs;
  var status = false.obs;
  checkboxUpdate(value) {
    checkboxvalue.value = value!;
    update();
  }

  connectionCheck() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        update();
      } else {
        connection.value = false;
        update();
      }
    });
  }

  toDate(date) {
    todate.value = date;
    print(todate.value);
    if (todate.value == date) {
      Loading.value = true;
      historycheckpoint();
    }
    update();
  }

  search(val, context) {
    if (val.isNotEmpty) {
      searchhistorylist.value = historyList.value
          .where((history) =>
              history.siteName.toLowerCase().contains(val.toLowerCase()))
          .toList();
      print(searchhistorylist.value.map((e) => e.siteName));
      historyList.value = searchhistorylist.value;
      FocusScope.of(context).nextFocus();
      update();
    } else {
      searchhistorylist.value.clear();
      historyList.value = mainhistorylist.value;
      update();
    }
    update();
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0)
      ..addListener(() {
        indicatorColor = colors[tabController!.index];
        update();
      });
    status.value = BaseUrl.storage.read("status");
    super.onInit();
    connectionCheck();
    Future.delayed(Duration(milliseconds: 200), () {
      mapupdate();
    });
    day = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[0];
    month = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[1];
    year = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[2];
    clockindate2 = DateTime.now().day;

    check = BaseUrl.storage
        .read("lastAttendanceRecordDate")
        .toString()
        .split('/')[0];

    update();
  }

  CurrentLocation() async {
    final location = new la.Location();
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    location.onLocationChanged.listen((la.LocationData cLoc) {
      center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
    });
    historycheckpoint();
    update();
  }

  checkpoint() async {
    Loading.value = true;
    update();
    if (siteController.text.toString() != '') {
      BaseUrl.storage
          .write("sitecheckpoint", siteController.text.toString().trim());
      BaseUrl.storage.write(
          "latlngcheckpoint",
          center.value.latitude.toString() +
              ',' +
              center.value.longitude.toString());

      if (checkpointImage != null) {
        if (BaseUrl.storage.read('checkOutMissing') == false) {
          var response = await API().CheckPoints(
            sitename: siteController.text.toString().trim(),
            note: noteController.text.toString().trim(),
            image: checkpointImage,
            latlng: center.value.latitude.toString() +
                ',' +
                center.value.longitude.toString(),
          );
          if (response.statusCode == 201) {
            siteController.clear();
            noteController.clear();
            historycheckpoint();
            checkpointImage = null;
            if (checkboxvalue.value == true) {
              status.value = true;
              Loading.value = false;
              Get.back();
              homeController.clockout(check: true);
              homeController.clockindate2 = DateTime.now().day;
            } else if (BaseUrl.storage.read("status") == false) {
              status.value = false;
              Loading.value = false;
              Get.back();
              homeController.clockin(check: true);
            }
            Get.snackbar(
              "Checkpoints ",
              'Successfully Added',
            );

            // Get.back();
          } else {
            Loading.value = false;
            Get.snackbar("Error ", response.data['error'].toString(),
                colorText: Colors.white, backgroundColor: Colors.red);
          }
        } else {
          Loading.value = false;
          Get.snackbar("Error ", "Please Do Previous Checkout",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        Loading.value = false;
        Get.snackbar("Error ", "Please Capture Image",
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error ", "Fill the required fields".toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  historycheckpoint() async {
    // Loading.value = true;
    historyList.value.clear();
    var date = todate.value.toString().split(' ');
    finaldate.value = date[0].toString();

    update();
    var response = await API().HistoryCheckPoints(
        date: finaldate.toString(), require: "myCheckPoints");
    if (response.statusCode == 200) {
      Loading.value = false;
      response = HistoryCheckpointModel.fromJson(response.data);
      historyList.value = response.data[0].checkPoints;
      mainhistorylist.value = historyList.value;
      print(mainhistorylist.value[0].image);
    } else {
      Loading.value = false;
    }
    update();
  }

  checkpointPdf() async {
    var date = todate.value.toString().split(' ');
    finaldate.value = date[0].toString();
    var response = await API().CheckPointPDf(date: finaldate.toString());
    if (response.statusCode == 200) {
      var urls = response.data['data'][0]['url'];

      print(urls);
      if (!await launch(
        urls,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )) {
        throw 'Could not launch $urls';
      }
    } else {
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }
  // getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //         center.value.latitude.toPrecision(8),
  //         center.value.longitude.toPrecision(8));
  //     print(center.value.latitude.toPrecision(8));
  //
  //     Placemark place = placemarks[0];
  //
  //     first.value = "${place.street} ,${place.subLocality},${place.name}";
  //     print(first.value);
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // getSetAddress() async {
  //   final coordinates =
  //       new Coordinates(center.value.latitude, center.value.longitude);
  //   final addresses =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   print(addresses);
  //   siteController.text = "${addresses[1].addressLine.camelCase}";
  // }

  mapdialog(index, context, width, height) {
    showHistoryPinsOnMap(index);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.clear)),
                  ),
                ),
                Container(
                  width: width,
                  height: height / 3,
                  child: GoogleMap(
                      zoomControlsEnabled: false,
                      compassEnabled: true,
                      markers: historymarkers.value,
                      mapType: MapType.normal,
                      initialCameraPosition: initialCameraPosition.value,
                      onTap: (LatLng loc) {},
                      onMapCreated: (GoogleMapController controller) {
                        controller = controller;
                      }),
                )
              ],
            ));
  }

  mapupdate() async {
    await CurrentLocation();

    initialCameraPosition.value = CameraPosition(
      target: LatLng(
        center.value.latitude,
        center.value.longitude,
      ),
      zoom: 14,
      tilt: 1.0,
      bearing: 30,
    );
    controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      zoom: 14,
      tilt: 0,
      bearing: 30,
      target: LatLng(
        center.value.latitude,
        center.value.longitude,
      ),
    )));
    update();

    showPinsOnMap();
  }

  void showPinsOnMap() {
    var pinPosition = LatLng(
      center.value.latitude,
      center.value.longitude,
    );

    markers.value.add(Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        onTap: () {}));

    update();
  }

  void showHistoryPinsOnMap(index) {
    historymarkers.clear();
    var latlong = historyList.value[index].location.split(",");
    double latitude = double.parse(latlong[0]);
    double longitude = double.parse(latlong[1]);
    var pinPosition = LatLng(
      latitude,
      longitude,
    );

    historymarkers.value.add(Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        onTap: () {}));

    update();
  }

  imgFromCameras() async {
    var image = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 1024,
        imageQuality: 60,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      checkpointImage = image;
    }
    update();
  }

  // String? validators(var values) {
  //   if (values.isEmpty) {
  //     return "Please this field must be filled";
  //   }
  //   return null;
  // }

  @override
  void onClose() {
    // tabController!.dispose();
    // controller!.dispose();
    super.onClose();
  }
}
