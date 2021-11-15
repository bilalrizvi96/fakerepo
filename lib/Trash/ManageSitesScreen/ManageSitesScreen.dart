// import 'package:attendencesystem/Component/DynamicColor.dart';
// import 'package:attendencesystem/Component/SideDrawer.dart';
// import 'package:attendencesystem/Controller/ManageSitesController.dart';
// import 'package:attendencesystem/Controller/SigninController.dart';
// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ManageSitesScreen extends StatelessWidget {
//   ManageSitesController manageSitesController =
//       Get.put(ManageSitesController());
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
//           child: GetBuilder(
//             init: manageSitesController,
//             builder: (_) {
//               return SingleChildScrollView(
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30.0),
//                       child: DelayedDisplay(
//                         delay: Duration(milliseconds: 800),
//                         slidingCurve: Curves.decelerate,
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: width / 20,
//                             ),
//
//                             SizedBox(
//                               width: width / 25,
//                             ),
//                             Container(
//                               width: width / 3,
//                               child: Text(
//                                 'Manage Sites',
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: width / 16,
//                                     color: DynamicColor().black),
//                               ),
//                             ),
//                             Spacer(),
//                             Image.asset(
//                               'assets/managesites.png',
//                               fit: BoxFit.cover,
//                               height: height / 8,
//                             ),
//                             SizedBox(
//                               width: width / 10,
//                             ),
//                             Builder(builder: (context) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   Scaffold.of(context).openDrawer();
//                                 },
//                                 child: Icon(
//                                   Icons.menu,
//                                   size: width / 13,
//                                   color: DynamicColor().primarycolor,
//                                 ),
//                               );
//                             }),
//                             SizedBox(
//                               width: width / 50,
//                             ),
//                             // Spacer(),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 130.0),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 1.65,
//                         decoration: BoxDecoration(
//                             color: Color(0xFFD1D1D1),
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 130.0, left: 330),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 8,
//                         decoration: BoxDecoration(
//                             color: Color(0xFFD1D1D1),
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 130.0, left: 390),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 16,
//                         decoration: BoxDecoration(
//                             color: DynamicColor().primarycolor,
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 160),
//                       child: Container(
//                         height: height,
//                         width: width,
//                         decoration: BoxDecoration(color: Color(0xFFEBEFFF)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 5, left: 10),
//                       child: Form(
//                         key: manageSitesController.managesitesFormKey,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: height / 4,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 35.0),
//                               child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Site Name',
//                                     style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: width / 30,
//                                         color: DynamicColor().black),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: height / 70,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: width / 80,
//                                   height: height / 18,
//                                   color: DynamicColor().primarycolor,
//                                 ),
//                                 Container(
//                                   width: width / 1.22,
//                                   child: TextFormField(
//                                     controller: manageSitesController
//                                         .sitesNameController,
//                                     validator: manageSitesController.validators,
//                                     cursorColor: DynamicColor().primarycolor,
//                                     style: GoogleFonts.poppins(
//                                         color: DynamicColor().primarycolor,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: new InputDecoration(
//                                         hintText: '',
//                                         focusColor: DynamicColor().primarycolor,
//                                         hoverColor: DynamicColor().primarycolor,
//
//                                         // labelText: "Enter Employee ID",
//                                         // labelStyle: ,
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         border: InputBorder.none
//
//                                         //fillColor: Colors.green
//                                         ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height / 40,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 35.0),
//                               child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Address',
//                                     style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: width / 30,
//                                         color: DynamicColor().black),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: height / 70,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: width / 80,
//                                   height: height / 18,
//                                   color: DynamicColor().primarycolor,
//                                 ),
//                                 Container(
//                                   width: width / 1.22,
//                                   child: TextFormField(
//                                     controller:
//                                         manageSitesController.addressController,
//                                     validator: manageSitesController.validators,
//
//                                     cursorColor: DynamicColor().primarycolor,
//                                     style: GoogleFonts.poppins(
//                                         color: DynamicColor().primarycolor,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: new InputDecoration(
//                                         hintText: '',
//                                         focusColor: DynamicColor().primarycolor,
//                                         hoverColor: DynamicColor().primarycolor,
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         border: InputBorder.none),
//                                     // keyboardType: TextInputType.none,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height / 30,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 35.0),
//                               child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'City',
//                                     style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: width / 30,
//                                         color: DynamicColor().black),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: height / 70,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: width / 80,
//                                   height: height / 18,
//                                   color: DynamicColor().primarycolor,
//                                 ),
//                                 Container(
//                                   width: width / 1.22,
//                                   child: TextFormField(
//                                     controller:
//                                         manageSitesController.cityController,
//                                     validator: manageSitesController.validators,
//                                     cursorColor: DynamicColor().primarycolor,
//                                     style: GoogleFonts.poppins(
//                                         color: DynamicColor().primarycolor,
//                                         fontWeight: FontWeight.w600),
//                                     decoration: new InputDecoration(
//                                         hintText: '',
//                                         focusColor: DynamicColor().primarycolor,
//                                         hoverColor: DynamicColor().primarycolor,
//
//                                         // labelText: "Enter Employee ID",
//                                         // labelStyle: ,
//                                         fillColor: Colors.white,
//                                         filled: true,
//                                         border: InputBorder.none
//
//                                         //fillColor: Colors.green
//                                         ),
//                                     // keyboardType: TextInputType.none,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height / 40,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 35.0),
//                               child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     'Type',
//                                     style: GoogleFonts.poppins(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: width / 30,
//                                         color: DynamicColor().black),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: height / 70,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: width / 80,
//                                   height: height / 18,
//                                   color: DynamicColor().primarycolor,
//                                 ),
//                                 Container(
//                                   width: width / 1.22,
//                                   color: DynamicColor().white,
//                                   padding:
//                                       EdgeInsets.only(right: 13.0, left: 13),
//                                   child: DropdownButton<String>(
//                                     value: manageSitesController
//                                         .dropdownValue.value,
//                                     isExpanded: true,
//                                     icon: Icon(
//                                       Icons.keyboard_arrow_down_sharp,
//                                       color: DynamicColor().primarycolor,
//                                     ),
//                                     iconSize: 24,
//                                     elevation: 16,
//                                     style: TextStyle(
//                                         color: DynamicColor().primarycolor,
//                                         fontWeight: FontWeight.bold),
//                                     underline: Container(
//                                       height: 2,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(500.0)),
//                                     ),
//                                     focusColor: DynamicColor().white,
//                                     dropdownColor: Colors.white,
//                                     onChanged: (newValue) {
//                                       manageSitesController
//                                           .valueupdate(newValue);
//                                       FocusScope.of(context).nextFocus();
//                                     },
//                                     items: <String>[
//                                       'Select Profession',
//                                       'Corporate Office',
//                                       'Regional Office',
//                                       'Site Office',
//                                     ].map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height / 30,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 manageSitesController.sitecreation();
//                               },
//                               child: Container(
//                                 width: width / 1.2,
//                                 height: height / 15,
//                                 decoration: BoxDecoration(
//                                     color: DynamicColor().primarycolor,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Text(
//                                   'Submit'.toUpperCase(),
//                                   style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w600,
//                                       color: DynamicColor().white),
//                                 )),
//                               ),
//                             ),
//                             SizedBox(
//                               height: height / 30,
//                             ),
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 width: width / 1.2,
//                                 height: height / 15,
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: DynamicColor().black),
//                                     // color: DynamicColor().primarycolor,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Text(
//                                   'View Sites'.toUpperCase(),
//                                   style: GoogleFonts.poppins(
//                                       fontWeight: FontWeight.w600,
//                                       color: DynamicColor().black),
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
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
