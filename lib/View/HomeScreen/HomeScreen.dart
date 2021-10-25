import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
            width: width,
            height: height,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: height / 3.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                            Text(
                              'Dashboard',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 16),
                            ),
                            Spacer(),
                            Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Icon(
                                  Icons.menu,
                                  size: width / 13,
                                  color: DynamicColor().primarycolor,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                DelayedDisplay(
                  fadeIn: true,
                  fadingDuration: Duration(milliseconds: 800),
                  child: GestureDetector(
                    onTap: () {
                      Get.offNamed('/faceverfication');
                    },
                    child: Container(
                      width: width / 1.2,
                      height: height / 15,
                      decoration: BoxDecoration(
                          border: Border.all(color: DynamicColor().white),
                          // color: DynamicColor().primarycolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Begin Verification',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: DynamicColor().white),
                      )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 400),
                        child: Container(
                          height: height / 3.5,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)),
                              color: DynamicColor().primarycolor),
                        ),
                      ),
                      Positioned(
                        top: height / 35,
                        right: width / 12,
                        left: width / 12,
                        child: DelayedDisplay(
                          fadeIn: true,
                          fadingDuration: Duration(milliseconds: 800),
                          child: GestureDetector(
                            onTap: () {
                              // Get.offNamed('/faceverfication');
                            },
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Punch your Attendance',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: width / 20,
                                      color: DynamicColor()
                                          .white
                                          .withOpacity(0.44)),
                                ),
                                SizedBox(
                                  height: height / 8,
                                ),
                                Text(
                                  'Scan QR code',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: width / 20,
                                      color: DynamicColor().white),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
