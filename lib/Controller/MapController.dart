// import 'package:attendencesystem/Controller/AttendenceController.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapController extends GetxController {
//   late GoogleMapController mapController;
//   AttendanceController attendanceController = Get.put(AttendanceController());
//   CameraPosition initialCameraPosition = CameraPosition(
//       zoom: 22, tilt: 0, bearing: 30, target: LatLng(24.9161647, 67.0653569));
//   final Set<Marker> markers = Set<Marker>().obs;
//   @override
//   void onInit() {
//     mapupdate();
//     update();
//     super.onInit();
//   }
//
//   mapupdate() async {
//     await attendanceController.CurrentLocation();
//     initialCameraPosition = CameraPosition(
//       target: LatLng(
//         attendanceController.center.value.latitude,
//         attendanceController.center.value.longitude,
//       ),
//       zoom: 18,
//       tilt: 0,
//       bearing: 30,
//     );
//     update();
//     showPinsOnMap();
//   }
//
//   void showPinsOnMap() {
//     var pinPosition = LatLng(
//       attendanceController.center.value.latitude,
//       attendanceController.center.value.longitude,
//     );
//
//     markers.add(Marker(
//         icon: BitmapDescriptor.defaultMarker,
//         markerId: MarkerId('sourcePin'),
//         position: pinPosition,
//         onTap: () {}));
//
//     update();
//   }
// }
