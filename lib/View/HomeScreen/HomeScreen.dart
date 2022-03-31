import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';

import 'package:attendencesystem/Controller/HomeController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/checkpoint');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: width / 16,
                                      color: DynamicColor().primarycolor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BaseUrl.storage.write("token", "out");
                                    Get.offAllNamed('/signinemp');
                                  },
                                  child: Icon(
                                    Icons.logout,
                                    size: width / 16,
                                    color: Colors.red,
                                  ),
                                ),
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
                              height: height / 8.349,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    alignment: Alignment.center,
                                    image: NetworkImage(
                                        "https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarybg.png"),
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
                                          ? "Hey, " + homeController.name
                                          : "Name",
                                      style: GoogleFonts.poppins(
                                          color: DynamicColor().white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: width / 20),
                                    ),
                                  ),
                                  Spacer(),
                                  Image.network(
                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarycalendar.png',
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
                            height: height / 50,
                          ),
                          DelayedDisplay(
                            fadeIn: true,
                            fadingDuration: Duration(milliseconds: 400),
                            child: Container(
                              height: height / 25,
                              width: width / 1.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width / 50,
                                  ),
                                  Container(
                                    width: width / 6,
                                    height: height / 35,
                                    decoration: BoxDecoration(
                                      color: DynamicColor().primarycolor,
                                      borderRadius: BorderRadius.circular(5.0),
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
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 15,
                                            height: 15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: DynamicColor().white,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Text(
                                              "!",
                                              style: TextStyle(
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width / 35),
                                            )),
                                        SizedBox(
                                          width: width / 50,
                                        ),
                                        Text(
                                          "Note",
                                          style: TextStyle(
                                              color: DynamicColor().white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: width / 32),
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
                                            .black
                                            .withOpacity(0.41),
                                        fontWeight: FontWeight.w600,
                                        fontSize: width / 30),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 12,
                              ),
                              Container(
                                width: width / 2.7,
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
                                          'Last In',
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
                                        width: width / 6.0,
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
                                width: width / 2.7,
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
                                          'Last Out',
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
                                        width: width / 6.0,
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
                              SizedBox(
                                width: width / 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          DelayedDisplay(
                            fadeIn: true,
                            fadingDuration: Duration(milliseconds: 400),
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Container(
                                width: width / 1.2,
                                height: height / 11,
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
                                      image: NetworkImage(
                                          "https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/presentbg.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Spacer(),
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    Image.network(
                                      'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/presenticon.png',
                                      fit: BoxFit.contain,
                                      width: width / 9,
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Text(
                                      BaseUrl.storage.read("totalPresent") !=
                                              null
                                          ? BaseUrl.storage
                                              .read("totalPresent")
                                              .toString()
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
                          ),
                          SizedBox(
                            height: height / 100,
                          ),
                          DelayedDisplay(
                            fadeIn: true,
                            fadingDuration: Duration(milliseconds: 400),
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Container(
                                width: width / 1.2,
                                height: height / 11,

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
                                      image: NetworkImage(
                                          "https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/absentbg.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Spacer(),
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    Image.network(
                                      'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/absenticon.png',
                                      fit: BoxFit.contain,
                                      width: width / 9,
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Text(
                                      BaseUrl.storage.read("totalAbsent") !=
                                              null
                                          ? BaseUrl.storage
                                              .read("totalAbsent")
                                              .toString()
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
                          ),
                          Spacer(),
                          homeController.Loading.value == false
                              ? DelayedDisplay(
                                  fadeIn: true,
                                  fadingDuration: Duration(milliseconds: 400),
                                  child: Container(
                                    height: height / 3.4,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0)),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width / 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            DelayedDisplay(
                                              fadeIn: true,
                                              fadingDuration:
                                                  Duration(milliseconds: 1200),
                                              child: Container(
                                                width: width / 2.5,
                                                height: height / 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: BaseUrl.storage.read(
                                                                "status") ==
                                                            false
                                                        ? Color(0xFF85A0F8)
                                                        : Colors.grey
                                                            .withOpacity(0.50),
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    5.0))),
                                                child: Text(
                                                  'Clock In',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: width / 25,
                                                      color:
                                                          DynamicColor().white),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (BaseUrl.storage
                                                        .read("status") ==
                                                    false) {
                                                  homeController.Loading.value =
                                                      true;
                                                  homeController.scan();
                                                }

                                                // homeController.valcheck.value='clockin';
                                                // homeController.clockin();
                                              },
                                              child: DelayedDisplay(
                                                fadeIn: true,
                                                fadingDuration: Duration(
                                                    milliseconds: 1200),
                                                child: Container(
                                                  width: width / 2.5,
                                                  height: height / 6,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                          bottomRight: Radius.circular(
                                                              5.0),
                                                          bottomLeft: Radius.circular(
                                                              5.0)),
                                                      border: Border.all(
                                                          color: BaseUrl.storage.read("status") == false
                                                              ? Color(0xFF85A0F8)
                                                                  .withOpacity(
                                                                      0.48)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      0.1)),
                                                      color: BaseUrl.storage.read("status") == false
                                                          ? Color(0xFFBBD7F5FF)
                                                              .withOpacity(0.10)
                                                          : Color(0xFFEAEAEAFF)
                                                              .withOpacity(0.1)),
                                                  child: Center(
                                                    child: BaseUrl.storage.read(
                                                                "status") ==
                                                            false
                                                        ? Image.network(
                                                            'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockIn.png',
                                                            height: height / 12,
                                                          )
                                                        : Image.network(
                                                            'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockInGray.png',
                                                            height: height / 12,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            DelayedDisplay(
                                              fadeIn: true,
                                              fadingDuration:
                                                  Duration(milliseconds: 1200),
                                              child: Container(
                                                width: width / 2.5,
                                                height: height / 25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: BaseUrl.storage.read(
                                                                "status") ==
                                                            true
                                                        ? Color(0xFFEE6969)
                                                        : Colors.grey
                                                            .withOpacity(0.50),
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    5.0))),
                                                child: Text(
                                                  'Clock Out',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: width / 25,
                                                      color:
                                                          DynamicColor().white),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                homeController.clockindate2 =
                                                    DateTime.now().hour;
                                                var check = BaseUrl.storage
                                                        .read('clockindate') -
                                                    homeController.clockindate2;
                                                if (check < 10) {
                                                  print(true);
                                                  print(check);
                                                  Get.bottomSheet(
                                                      ReasonBottom(
                                                        width: width,
                                                        height: height,
                                                      ),
                                                      elevation: 20.0,
                                                      enableDrag: false,
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                15.0),
                                                        topRight:
                                                            Radius.circular(
                                                                15.0),
                                                      )));
                                                } else {
                                                  homeController.scan();
                                                  homeController.Loading.value =
                                                      true;
                                                }

                                                // homeController.valcheck.val
                                              },
                                              child: DelayedDisplay(
                                                fadeIn: true,
                                                fadingDuration: Duration(
                                                    milliseconds: 1200),
                                                child: Container(
                                                  width: width / 2.5,
                                                  height: height / 6,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(
                                                              5.0),
                                                          bottomRight: Radius.circular(
                                                              5.0)),
                                                      border: Border.all(
                                                          color: BaseUrl.storage.read("status") == true
                                                              ? Color(0xFFEE6969)
                                                                  .withOpacity(
                                                                      0.46)
                                                              : Colors.grey
                                                                  .withOpacity(
                                                                      0.1)),
                                                      color: BaseUrl.storage.read("status") == true
                                                          ? Color(0xFFFAC5C5)
                                                              .withOpacity(0.10)
                                                          : Color(0xFFEAEAEAFF)
                                                              .withOpacity(0.1)),
                                                  child: Center(
                                                    child: BaseUrl.storage.read(
                                                                "status") ==
                                                            true
                                                        ? Image.network(
                                                            'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockout.png',
                                                            height: height / 12,
                                                          )
                                                        : Image.network(
                                                            'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockOutGray.png',
                                                            height: height / 12,
                                                          ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          width: width / 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Image.asset(
                                    "assets/1.gif",
                                    height: 200,
                                    width: 200,
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

class ReasonBottom extends StatelessWidget {
  ReasonBottom({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(DateTime.now());

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height / 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 45.0,
            ),
            child: Text(
              '${outputDate1 + 10.toString()}',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black,
                  fontSize: width / 22,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          Center(
            child: Container(
              width: width / 1.2,
              height: height / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  border: Border.all(color: Color(0xFFDEDEDE))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  // Text(
                  //   branchname,
                  //   style: Theme.of(context).textTheme.caption!.copyWith(
                  //       color: DynamicColor().primarycolor,
                  //       fontSize: width / 25,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(
                    width: width / 20,
                  ),
                  // Icon(
                  //   Icons.keyboard_arrow_down_sharp,
                  //   color: Colors.black,
                  // ),
                  // SizedBox(
                  //   width: width / 20,
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          SizedBox(
            height: height / 80,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 45.0,
            ),
            child: Text(
              'Reason',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.black,
                  fontSize: width / 22,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          Center(
            child: Container(
              width: width / 1.2,
              child: TextFormField(
                // controller: _feedbackController.feedbackcontroller,
                // validator: _feedbackController.validators,
                maxLines: 6,
                maxLength: 1000,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: DynamicColor().titletextcolor, width: 1.2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: DynamicColor().titletextcolor, width: 1.0),
                  ),
                  hintText: 'Write your reason',
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: TextButton(
                onPressed: () {},
                child: Container(
                  width: width / 1.25,
                  height: height / 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: DynamicColor().primarycolor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        fontSize: width / 25,
                        fontWeight: FontWeight.w600),
                  ),
                )),
          ),
          SizedBox(
            height: height / 80,
          ),
        ],
      ),
    );
  }
}
