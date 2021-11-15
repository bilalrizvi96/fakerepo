// import 'package:attendencesystem/Component/DynamicColor.dart';
// import 'package:attendencesystem/Controller/SigninController.dart';
// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import 'package:google_fonts/google_fonts.dart';
//
// class SigninScreen extends StatelessWidget {
//   // const SigninScreen({Key? key}) : super(key: key);
//   SigninController signinController = Get.put(SigninController());
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: width,
//           height: height,
//           // padding: EdgeInsets.only(right: 5, left: 10),
//           // color: DynamicColor().white,
//           child: GetBuilder(
//             init: signinController,
//             builder: (_) {
//               return Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30.0),
//                     child: DelayedDisplay(
//                       fadeIn: true,
//                       child: Row(
//                         children: [
//                           Spacer(),
//                           Text(
//                             'Sign in',
//                             style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: width / 14,
//                                 color: DynamicColor().black),
//                           ),
//                           // SizedBox(
//                           //   height: height / 90,
//                           // ),
//                           Spacer(),
//                           Image.asset(
//                             'assets/signinclock.png',
//                             fit: BoxFit.contain,
//                             width: width / 4,
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                     ),
//                   ),
//                   DelayedDisplay(
//                     fadeIn: true,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 120.0),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 1.65,
//                         decoration: BoxDecoration(
//                             color: Color(0xFFD1D1D1),
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                   ),
//                   DelayedDisplay(
//                     fadeIn: true,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 120.0, left: 330),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 8,
//                         decoration: BoxDecoration(
//                             color: Color(0xFFD1D1D1),
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                   ),
//                   DelayedDisplay(
//                     fadeIn: true,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 120.0, left: 390),
//                       child: Container(
//                         height: height / 500,
//                         width: width / 16,
//                         decoration: BoxDecoration(
//                             color: DynamicColor().primarycolor,
//                             borderRadius: BorderRadius.circular(10.0)),
//                       ),
//                     ),
//                   ),
//                   DelayedDisplay(
//                     fadingDuration: Duration(milliseconds: 800),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 160),
//                       child: Container(
//                         height: height / 1.3,
//                         width: width,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(50.0),
//                                 topLeft: Radius.circular(50.0)),
//                             color: Color(0xFFEBEFFF)),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 5, left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: height / 5,
//                         ),
//                         DelayedDisplay(
//                           delay: Duration(milliseconds: 1200),
//                           slidingCurve: Curves.decelerate,
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 10.0, left: 10),
//                             child: Container(
//                               height: height / 4,
//                               decoration: signinController.values.value == 0
//                                   ? BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/hrback.png'),
//                                         fit: BoxFit.contain,
//                                       ),
//                                     )
//                                   : BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/CardWhitebg.png'),
//                                         fit: BoxFit.contain,
//                                       ),
//                                     ),
//                               padding:
//                                   EdgeInsets.only(right: 20, top: 10, left: 20),
//                               child: Stack(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Radio(
//                                       groupValue: signinController.values.value,
//                                       onChanged: (value) {
//                                         signinController.valuechaneg(value);
//                                       },
//                                       value: 0,
//                                       activeColor: DynamicColor().radiocolor,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: height / 30,
//                                     left: width / 20,
//                                     child: Row(
//                                       children: [
//                                         // Spacer(),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'HR',
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: width / 12.5,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: signinController
//                                                               .values.value ==
//                                                           0
//                                                       ? DynamicColor().white
//                                                       : DynamicColor()
//                                                           .primarycolor),
//                                             ),
//                                             Text(
//                                               'Login as super admin.',
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: width / 30,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: signinController
//                                                               .values.value ==
//                                                           0
//                                                       ? DynamicColor()
//                                                           .white
//                                                           .withOpacity(0.59)
//                                                       : DynamicColor()
//                                                           .primarycolor),
//                                             ),
//                                           ],
//                                         ),
//                                         // Spacer(),
//                                         SizedBox(
//                                           width: width / 8,
//                                         ),
//                                         Image.asset(
//                                           'assets/person.png',
//                                           fit: BoxFit.scaleDown,
//                                           // width: width,
//                                           // height: height,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: height / 200,
//                         ),
//                         DelayedDisplay(
//                           delay: Duration(milliseconds: 1500),
//                           slidingCurve: Curves.decelerate,
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 10.0, left: 10),
//                             child: Container(
//                               height: height / 4,
//                               decoration: signinController.values.value == 1
//                                   ? BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage('assets/hrback.png'),
//                                         fit: BoxFit.contain,
//                                       ),
//                                       // shape: BoxShape.rectangle,
//                                     )
//                                   : BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/CardWhitebg.png'),
//                                         fit: BoxFit.contain,
//                                       ),
//                                       // shape: BoxShape.rectangle,
//                                     ),
//                               padding:
//                                   EdgeInsets.only(right: 20, top: 10, left: 20),
//                               child: Stack(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.topRight,
//                                     child: Radio(
//                                       groupValue: signinController.values.value,
//                                       onChanged: (value) {
//                                         signinController.valuechaneg(value);
//                                       },
//                                       activeColor: DynamicColor().radiocolor,
//                                       value: 1,
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: height / 30,
//                                     left: width / 20,
//                                     child: Row(
//                                       children: [
//                                         // Spacer(),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Employee',
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: width / 12.5,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: signinController
//                                                               .values.value ==
//                                                           1
//                                                       ? DynamicColor().white
//                                                       : DynamicColor()
//                                                           .primarycolor),
//                                             ),
//                                             Text(
//                                               'Login as super admin.',
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: width / 30,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: signinController
//                                                               .values.value ==
//                                                           1
//                                                       ? DynamicColor()
//                                                           .white
//                                                           .withOpacity(0.59)
//                                                       : DynamicColor()
//                                                           .primarycolor),
//                                             ),
//                                           ],
//                                         ),
//                                         // Spacer(),
//                                         SizedBox(
//                                           width: width / 10,
//                                         ),
//                                         Image.asset(
//                                           'assets/groupperson.png',
//                                           fit: BoxFit.scaleDown,
//                                           // width: width,
//                                           // height: height,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: height / 20,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             signinController
//                                 .nextScreen(signinController.values.value);
//                           },
//                           child: DelayedDisplay(
//                             delay: Duration(milliseconds: 2000),
//                             slidingCurve: Curves.decelerate,
//                             child: Container(
//                               width: width / 1.2,
//                               height: height / 15,
//                               decoration: BoxDecoration(
//                                   color: DynamicColor().primarycolor,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Center(
//                                   child: Text(
//                                 'Next'.toUpperCase(),
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     color: DynamicColor().white),
//                               )),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
