import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class MaintainceScreen extends StatelessWidget {
  const MaintainceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/maintaince.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: height / 40,
              ),
              Text(
                'Maintenance'.toUpperCase(),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: width / 16),
              ),
              SizedBox(
                height: height / 40,
              ),
              Container(
                height: height / 7,
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40.0, left: 40.0),
                    child: Text(
                      'We are currently undergoing maintenance this won\'t take long',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: DynamicColor().primarycolor,
                          fontWeight: FontWeight.w300,
                          fontSize: width / 26),
                    ),
                  ),
                ),
              ),
              SlideCountdownSeparated(
                height: height / 15,
                width: width / 7.5,
                decoration: BoxDecoration(
                    color: DynamicColor().primarycolor,
                    borderRadius: BorderRadius.circular(10.0)),
                curve: Curves.ease,
                onDone: () {
                  Get.offAllNamed('/updatescreen');
                },
                duration: const Duration(hours: 2000),
              )
            ],
          ),
        ),
      ),
    );
  }
}
