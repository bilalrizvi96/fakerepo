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
            color: Colors.white30,
            child: GetBuilder(
                init: homeController,
                builder: (_) {
                  return Stack(
                    children: [
                      Container(
                        width: width,
                        height: height / 5.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Column(
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
                              height: height / 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage("assets/summarybg.png"),
                                    fit: BoxFit.cover),
                              ),
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width / 3,
                                    child: Text(
                                      BaseUrl.storage.read("name") != null
                                          ? "Hey " +
                                              BaseUrl.storage.read("name") +
                                              ","
                                          : "Name",
                                      style: GoogleFonts.poppins(
                                          color: DynamicColor().white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: width / 20),
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    'assets/summarycalendar.png',
                                    height: height / 22,
                                  ),
                                  Text(
                                    " ${homeController.current.value}",
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: width / 28),
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
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 25,
                                ),
                                Container(
                                  width: width / 3,
                                  height: height / 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE5E5E5).withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            'Clock In',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    DynamicColor().primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: width / 30),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: width / 7,
                                          height: height / 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF85A0F8),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            BaseUrl.storage.read("clockin") !=
                                                    null
                                                ? "${BaseUrl.storage.read("clockin")}"
                                                : "00:00",
                                            style: GoogleFonts.poppins(
                                                color: DynamicColor().white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: width / 30),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: width / 2.8,
                                  height: height / 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE5E5E5).withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 12.0),
                                          child: Text(
                                            'Clock Out',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    DynamicColor().primarycolor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: width / 30),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: width / 7,
                                          height: height / 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEE6969),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Text(
                                            BaseUrl.storage.read("clockout") !=
                                                    null
                                                ? "${BaseUrl.storage.read("clockout")}"
                                                : "00:00",
                                            style: GoogleFonts.poppins(
                                                color: DynamicColor().white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: width / 30),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   BaseUrl.storage.read("clock") != null
                                //       ? 'Clock In: ${BaseUrl.storage.read("clock")}'
                                //       : "Clock In: 00:00",
                                //   style: GoogleFonts.poppins(
                                //       color: DynamicColor().black,
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: width / 30),
                                // ),
                                SizedBox(
                                  width: width / 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
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
                                    offset: Offset(
                                        0, 20), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage("assets/presentbg.png"),
                                    fit: BoxFit.contain),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Spacer(),
                                  SizedBox(
                                    width: width / 60,
                                  ),
                                  Image.asset(
                                    'assets/presenticon.png',
                                    fit: BoxFit.contain,
                                    width: width / 7,
                                  ),
                                  SizedBox(
                                    width: width / 40,
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
                                    "Present",
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
                                    offset: Offset(
                                        0, 20), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: AssetImage("assets/absentbg.png"),
                                    fit: BoxFit.contain),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Spacer(),
                                  SizedBox(
                                    width: width / 60,
                                  ),
                                  Image.asset(
                                    'assets/absenticon.png',
                                    fit: BoxFit.contain,
                                    width: width / 7,
                                  ),
                                  SizedBox(
                                    width: width / 40,
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
                                    "Absent",
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
                                  height: height / 3.4,
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
                                // right: width / 14,
                                // left: width / 12,
                                child: DelayedDisplay(
                                  fadeIn: true,
                                  fadingDuration: Duration(milliseconds: 800),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          BaseUrl.storage.read("status") ==
                                                  false
                                              ? 'Scan to Clock In'
                                              : 'Scan to Clock Out',
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
                                        SizedBox(
                                          height: height / 80,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: DelayedDisplay(
                                            fadeIn: true,
                                            fadingDuration:
                                                Duration(milliseconds: 400),
                                            child: Container(
                                              height: height / 18,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0)),
                                                  color: Color(0xFF395BCC)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 6,
                                                    height: height / 35,
                                                    decoration: BoxDecoration(
                                                      color: DynamicColor()
                                                          .primarycolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: DynamicColor()
                                                              .primarycolor
                                                              .withOpacity(0.1),
                                                          spreadRadius: 4,
                                                          blurRadius: 6,
                                                          offset: Offset(0,
                                                              1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            width: 15,
                                                            height: 15,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  DynamicColor()
                                                                      .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            child: Text(
                                                              "!",
                                                              style: TextStyle(
                                                                  color: DynamicColor()
                                                                      .primarycolor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      width /
                                                                          35),
                                                            )),
                                                        SizedBox(
                                                          width: width / 50,
                                                        ),
                                                        Text(
                                                          "Note",
                                                          style: TextStyle(
                                                              color:
                                                                  DynamicColor()
                                                                      .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  width / 32),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width / 50,
                                                  ),
                                                  Text(
                                                    "Avoid Multiple Check-ins",
                                                    style: TextStyle(
                                                        color: DynamicColor()
                                                            .white
                                                            .withOpacity(0.41),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width / 30),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
