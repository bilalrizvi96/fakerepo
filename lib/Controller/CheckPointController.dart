import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart' as la;

import '../API/API.dart';
import '../Model/HistoryCheckpointModel.dart';

class CheckPointController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  XFile? faceImage;
  var first = ''.obs;
  var finaldate = ''.obs;
  TabController? tabController;
  var searchhistorylist = [].obs;
  var mainhistorylist = [].obs;
  var checkpointFormKey = GlobalKey<FormState>();
  var todate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var siteController = TextEditingController();
  var noteController = TextEditingController();
  var center = new LatLng(33.652100, 75.123398).obs;
  var Loading = false.obs;
  GoogleMapController? controller;
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
  toDate(date) {
    todate.value = date;
    print(todate.value);
    if (todate.value == date) {
      Loading.value = true;
      historycheckpoint();
    }
    update();
  }

  search(val) {
    if (val.isNotEmpty) {
      searchhistorylist.value = historyList.value
          .where((history) =>
              history.siteName.toLowerCase().contains(val.toLowerCase()))
          .toList();
      print(searchhistorylist.value.map((e) => e.siteName));
      historyList.value = searchhistorylist.value;
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

    super.onInit();
    Future.delayed(Duration(milliseconds: 200), () {
      mapupdate();
    });

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
    if (checkpointFormKey.currentState!.validate() &&
        checkpointFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      if (faceImage != null) {
        var response = await API().CheckPoints(
          sitename: siteController.text.toString().trim(),
          note: noteController.text.toString().trim(),
          image: faceImage,
          latlng: center.value.latitude.toString() +
              ',' +
              center.value.longitude.toString(),
        );
        if (response.statusCode == 201) {
          siteController.clear();
          noteController.clear();
          historycheckpoint();
          faceImage = null;
          Loading.value = false;
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
        Get.snackbar("Error ", "Please Upload Image",
            colorText: Colors.white, backgroundColor: Colors.red);
      }
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
    } else {
      Loading.value = false;
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
        imageQuality: 10,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      faceImage = image;
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

  @override
  void onClose() {
    // tabController!.dispose();
    // controller!.dispose();
    super.onClose();
  }
}
