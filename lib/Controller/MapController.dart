// import 'dart:async';
//
// import 'package:attendencesystem/Controller/AttendenceController.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapController extends GetxController {
//   late GoogleMapController mapController;
//   var center = new LatLng(33.652100, 75.123398).obs;
//   GoogleMapController? controller;
//   var initialCameraPosition = CameraPosition(
//           zoom: 22,
//           tilt: 0,
//           bearing: 30,
//           target: LatLng(24.9161647, 67.0653569))
//       .obs;
//   var markers = Set<Marker>().obs;
//   @override
//   void onInit() {
//     mapupdate();
//
//     super.onInit();
//
//     update();
//   }
//
//   CurrentLocation() async {
//     final location = new Location();
//     Position position = await Geolocator.getCurrentPosition();
//     center.value = LatLng(position.latitude, position.longitude);
//     location.onLocationChanged.listen((LocationData cLoc) {
//       center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
//     });
//
//     update();
//   }
//
//   mapupdate() async {
//     await CurrentLocation();
//     controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       zoom: 22,
//       tilt: 0,
//       bearing: 30,
//       target: LatLng(
//         center.value.latitude,
//         center.value.longitude,
//       ),
//     )));
//     update();
//     initialCameraPosition.value = CameraPosition(
//       target: LatLng(
//         center.value.latitude,
//         center.value.longitude,
//       ),
//       zoom: 18,
//       tilt: 1.0,
//       bearing: 30,
//     );
//     update();
//     showPinsOnMap();
//   }
//
//   void showPinsOnMap() {
//     var pinPosition = LatLng(
//       center.value.latitude,
//       center.value.longitude,
//     );
//
//     markers.value.add(Marker(
//         icon: BitmapDescriptor.defaultMarker,
//         markerId: MarkerId('sourcePin'),
//         position: pinPosition,
//         onTap: () {}));
//
//     update();
//   }
// }
