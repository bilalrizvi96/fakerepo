// import 'package:attendencesystem/Component/DynamicColor.dart';
// import 'package:attendencesystem/Trash/SigninController.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class CredentialsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Container(
//         width: width,
//         height: height,
//         color: Color(0xFFEBEFFF),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 5, left: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Update your Credentials Here',
//                 style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w500,
//                     fontSize: width / 29,
//                     color: DynamicColor().black),
//               ),
//               SizedBox(
//                 height: height / 20,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Fluttertoast.showToast(
//                       msg: "PLease Contact HR",
//                       toastLength: Toast.LENGTH_LONG,
//                       gravity: ToastGravity.SNACKBAR,
//                       timeInSecForIosWeb: 1,
//                       backgroundColor: Colors.red,
//                       textColor: Colors.white);
//                   // Get.toNamed('/facerule');
//                 },
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: width / 3.2,
//                       height: height / 5.2,
//                       decoration: BoxDecoration(
//                         color: DynamicColor().white,
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       padding: EdgeInsets.all(8.0),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 18.0, right: 15, left: 20),
//                       child: Image.asset(
//                         'assets/face.png',
//                         fit: BoxFit.scaleDown,
//                         height: height / 10,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 130.0, right: 45, left: 45),
//                       child: Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: DynamicColor()
//                                     .titletextcolor
//                                     .withOpacity(0.5),
//                                 spreadRadius: 3,
//                                 blurRadius: 10,
//                                 offset:
//                                     Offset(0, 3), // changes position of shadow
//                               ),
//                             ],
//                             color: DynamicColor().primarycolor),
//                         child: Icon(
//                           Icons.edit,
//                           size: 18,
//                           color: Colors.white,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height / 15,
//               ),
//               SizedBox(
//                 height: height / 8,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Fluttertoast.showToast(
//                       msg: "PLease Contact HR",
//                       toastLength: Toast.LENGTH_LONG,
//                       gravity: ToastGravity.CENTER,
//                       timeInSecForIosWeb: 1,
//                       backgroundColor: Colors.red,
//                       textColor: Colors.white);
//                 },
//                 child: Container(
//                   width: width / 1.2,
//                   height: height / 15,
//                   decoration: BoxDecoration(
//                       color: DynamicColor().primarycolor,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Center(
//                       child: Text(
//                     'Update'.toUpperCase(),
//                     style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w600,
//                         color: DynamicColor().white),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
