// import 'package:attendencesystem/Component/DynamicColor.dart';
// import 'package:attendencesystem/Component/SideDrawer.dart';
//
// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../ViewSitesController.dart';
//
// class ViewSitesScreen extends StatelessWidget {
//   // SigninController signinController = Get.put(SigninController());
//   ViewSitesController viewSitesController = Get.put(ViewSitesController());
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       drawer: Drawers().drawers(context),
//       body: SafeArea(
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: DynamicColor().primarycolor.withOpacity(0.25),
//                 spreadRadius: 3,
//                 blurRadius: 10,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ],
//             color: Color(0xFFEBEFFF),
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(40.0),
//                 topLeft: Radius.circular(40.0)),
//           ),
//           child: GetBuilder(
//             init: viewSitesController,
//             builder: (_) {
//               return Padding(
//                 padding: const EdgeInsets.only(right: 5, left: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount: 5,
//                           itemBuilder: (_, index) {
//                             return Padding(
//                               padding:
//                                   EdgeInsets.only(top: 10, left: 26, right: 26),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     width: width / 1.2,
//                                     height: height / 3.5,
//                                     child: Card(
//                                       elevation: 3,
//                                       color: DynamicColor().primarycolor,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(25.0),
//                                       ),
//                                       // child:,
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 6.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         SizedBox(
//                                           width: width / 30,
//                                         ),
//                                         Switch(
//                                           value: viewSitesController
//                                               .isSwitch.value,
//                                           onChanged: (value) {
//                                             viewSitesController
//                                                 .tooglechange(value);
//                                           },
//                                           activeTrackColor: Color(0xFFA2B3FC),
//                                           inactiveTrackColor:
//                                               DynamicColor().white,
//                                           inactiveThumbColor:
//                                               DynamicColor().primarycolor,
//                                           activeColor:
//                                               DynamicColor().primarycolor,
//                                         ),
//                                         Spacer(),
//                                         Container(
//                                           width: 25,
//                                           height: 20,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0)),
//                                           child: Center(
//                                             child: Icon(
//                                               Icons.share_outlined,
//                                               size: 17,
//                                               color:
//                                                   DynamicColor().primarycolor,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: width / 30,
//                                         ),
//                                         Container(
//                                           width: 25,
//                                           height: 20,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0)),
//                                           child: Center(
//                                             child: Icon(
//                                               Icons.edit_outlined,
//                                               size: 17,
//                                               color:
//                                                   DynamicColor().primarycolor,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: width / 10,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: height / 15,
//                                     child: Container(
//                                       width: width / 1.2,
//                                       height: height / 4.57,
//                                       child: Card(
//                                         elevation: 5,
//                                         color: DynamicColor().white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(25.0),
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SizedBox(
//                                               height: height / 30,
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: width / 10,
//                                                 ),
//                                                 Icon(Icons.apartment_sharp),
//                                                 SizedBox(
//                                                   width: width / 20,
//                                                 ),
//                                                 Text(
//                                                   'Manhill Advertising',
//                                                   style: GoogleFonts.poppins(
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: width / 33),
//                                                 )
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: height / 40,
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   width: width / 10,
//                                                 ),
//                                                 Icon(Icons.location_on),
//                                                 SizedBox(
//                                                   width: width / 20,
//                                                 ),
//                                                 Expanded(
//                                                   child: Text(
//                                                     '41-U, Dr. Mahmood Hussain Road,P.E.C.H.S Block 6، Block 6 PECHS, Karachi,Karachi City, Sindh 75400',
//                                                     maxLines: 3,
//                                                     softWrap: false,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     style: GoogleFonts.poppins(
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontSize: width / 33),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         right: 130, top: 30, left: 140),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(5.0),
//                                           // border:
//                                               Border.all(color: Colors.white),
//                                           color: Colors.white),
//                                       child: Icon(
//                                         Icons.qr_code_sharp,
//                                         color: Colors.black.withOpacity(0.75),
//                                         size: width / 6,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
