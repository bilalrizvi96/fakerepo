import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Controller/AttendenceController.dart';

import 'package:attendencesystem/Controller/HomeController.dart';
import 'package:attendencesystem/Controller/SignInEmployeeController.dart';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  AttendanceController attendanceController = Get.put(AttendanceController());
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
            child: GetBuilder(
                init: homeController,
                builder: (_) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 22.0, left: 22.0, top: 22.0),
                        child: Row(
                          children: [
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
                      SizedBox(
                        height: height / 50,
                      ),
                      DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 400),
                        child: Container(
                          width: width / 1.2,
                          height: height / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage("assets/summarybg.png"),
                                fit: BoxFit.contain),
                          ),
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                BaseUrl.storage.read("name") != null
                                    ? BaseUrl.storage.read("name")
                                    : "Name",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 20),
                              ),
                              Text(
                                "Welcome back, Let's get some stuff rolling!,",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 30),
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 280.0, left: 30, top: 5),
                        child: Text(
                          'Month: ${homeController.current.value}',
                          style: GoogleFonts.poppins(
                              color: DynamicColor().black,
                              fontWeight: FontWeight.w600,
                              fontSize: width / 30),
                        ),
                      ),
                      DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 400),
                        child: Container(
                          width: width / 1.2,
                          height: height / 9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 20), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage("assets/presentbg.png"),
                                fit: BoxFit.contain),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Spacer(),
                              SizedBox(
                                width: width / 80,
                              ),
                              Image.asset(
                                'assets/presenticon.png',
                                fit: BoxFit.contain,
                                width: width / 7,
                              ),
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                BaseUrl.storage.read("totalPresent") != null
                                    ? BaseUrl.storage.read("totalPresent")
                                    : "0",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 14),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text(
                                "Total Present",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 20),
                              ),
                              SizedBox(
                                width: width / 8,
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 400),
                        child: Container(
                          width: width / 1.2,
                          height: height / 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset:
                                    Offset(0, 20), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage("assets/absentbg.png"),
                                fit: BoxFit.contain),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Spacer(),
                              SizedBox(
                                width: width / 80,
                              ),
                              Image.asset(
                                'assets/absenticon.png',
                                fit: BoxFit.contain,
                                width: width / 7,
                              ),
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                BaseUrl.storage.read("totalAbsent") != null
                                    ? BaseUrl.storage.read("totalAbsent")
                                    : "0",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 14),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text(
                                "Total Absents",
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 20),
                              ),
                              SizedBox(
                                width: width / 8,
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                      Spacer(),
                      Stack(
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
                            top: height / 20,
                            right: width / 12,
                            left: width / 12,
                            child: GestureDetector(
                              onTap: () {
                                attendanceController.scan();
                              },
                              child: Image.asset(
                                'assets/qrdashboard.png',
                                height: height / 5,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height / 30,
                            right: width / 14,
                            left: width / 12,
                            child: DelayedDisplay(
                              fadeIn: true,
                              fadingDuration: Duration(milliseconds: 800),
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
                        ],
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
