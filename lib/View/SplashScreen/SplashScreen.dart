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
    splashController.check();
    splashController.context = context;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: splashController,
        builder: (_) {
          return splashController.connection == true
              ? Scaffold(
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
                          'Beta Release',
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
                )
              : Scaffold(
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/oops.png'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Text(
                          "OOPS",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.59),
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 12),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            "No Internet Connection found.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.59),
                              fontSize: MediaQuery.of(context).size.width / 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 22,
                        ),
                        GestureDetector(
                          onTap: () {
                            splashController.check();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                                color: DynamicColor().primarycolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Try Again'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
