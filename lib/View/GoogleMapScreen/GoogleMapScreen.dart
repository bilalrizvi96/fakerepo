// import 'package:attendencesystem/Controller/MapController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoogleMapScreen extends StatelessWidget {
//   GoogleMapScreen({Key? key}) : super(key: key);
//   MapController mapControllers = Get.put(MapController());
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: width,
//           height: height,
//           child: GetBuilder(
//               init: mapControllers,
//               builder: (_) {
//                 return GoogleMap(
//                     myLocationEnabled: true,
//                     compassEnabled: true,
//                     tiltGesturesEnabled: false,
//                     markers: mapControllers.markers.obs,
//                     // polylines: mapControllers.polyline.obs,
//                     mapType: MapType.normal,
//                     initialCameraPosition: mapControllers.initialCameraPosition,
//                     onTap: (LatLng loc) {},
//                     onMapCreated: (GoogleMapController controller) {});
//               }),
//         ),
//       ),
//     );
//   }
// }
