import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: DynamicColor().primarycolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Splash.png',
              fit: BoxFit.cover,
              height: height / 4,
            )
            // RichText(
            //   text: TextSpan(
            //     text: 'Star ',
            //     style: GoogleFonts.poppins(
            //         color: DynamicColor().white,
            //         fontStyle: FontStyle.normal,
            //         fontWeight: FontWeight.w300,
            //         fontSize: width / 9),
            //     children: <TextSpan>[
            //       TextSpan(
            //         text: 'Marketing',
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w200,
            //             fontSize: width / 14,
            //             color: DynamicColor().white),
            //       )
            //     ],
            //   ),
            // ),
            // Text(
            //   'Attendance',
            //   style: GoogleFonts.poppins(
            //       fontWeight: FontWeight.w200,
            //       fontSize: width / 14,
            //       color: DynamicColor().white),
            // )
          ],
        ),
      ),
    );
  }
}
