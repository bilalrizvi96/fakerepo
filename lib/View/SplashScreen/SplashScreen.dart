import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    // splashController.check();
    // splashController.context = context;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: splashController,
        builder: (_) {
          return Scaffold(
            body: Container(
              width: width,
              height: height,
              color: DynamicColor().primarycolor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.cover,
                    height: height / 4,
                  ),
                  Spacer(),
                  Text(
                    'v ${BaseUrl.version}',
                    style: GoogleFonts.poppins(
                        color: DynamicColor().white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: height / 50,
                  )
                ],
              ),
            ),
          );
        });
  }
}
