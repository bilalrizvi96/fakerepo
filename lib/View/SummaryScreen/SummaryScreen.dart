import 'dart:io';

import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Trash/SideDrawer.dart';

import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  SummaryController summaryController = Get.put(SummaryController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      // drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
            width: width,
            height: height,
            child: GetBuilder(
                init: summaryController,
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
                              'Summary',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 16),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                BaseUrl.storage.write("token", null);
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
                        height: height / 40,
                      ),
                      DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 800),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/summarybg.png',
                                fit: BoxFit.contain,
                                width: width / 1.1,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 10,
                                ),
                                Text('Summary',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: width / 21,
                                        color: DynamicColor().white)),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Image.asset(
                                    'assets/summarycalendar.png',
                                    height: height / 13,
                                  ),
                                ),
                                SizedBox(
                                  width: width / 10,
                                ),
                              ],
                            ),
                            Positioned(
                              top: height / 12,
                              left: width / 10,
                              right: width / 20,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(DateTime.now().year,
                                              DateTime.now().month, 1),
                                          maxTime: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day),
                                          onConfirm: (date) {
                                        summaryController.fromDate(date);
                                        print('confirm $date');
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: Container(
                                      height: height / 22,
                                      width: width / 7,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: DynamicColor()
                                              .primarycolor
                                              .withOpacity(0.40)),
                                      child: Center(
                                        child: Text(
                                            summaryController.fromdate.value.day
                                                    .toString() +
                                                " / " +
                                                summaryController
                                                    .fromdate.value.month
                                                    .toString(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: width / 21,
                                                color: DynamicColor().white)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Text('to',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: width / 21,
                                          color: DynamicColor().white)),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              summaryController
                                                  .fromdate.value.day),
                                          maxTime: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day),
                                          onConfirm: (date) {
                                        summaryController.toDate(date);
                                      },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en);
                                    },
                                    child: Container(
                                      height: height / 22,
                                      width: width / 7,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: DynamicColor()
                                              .primarycolor
                                              .withOpacity(0.40)),
                                      child: Center(
                                        child: Text(
                                            summaryController.todate.value.day
                                                    .toString() +
                                                " / " +
                                                summaryController
                                                    .todate.value.month
                                                    .toString(),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: width / 21,
                                                color: DynamicColor().white)),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      summaryController.summarylist.length != 0
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      summaryController.summarylist.length,
                                  itemBuilder: (_, index) {
                                    return summaryController.Loading.value ==
                                            false
                                        ? DelayedDisplay(
                                            fadeIn: true,
                                            fadingDuration:
                                                Duration(milliseconds: 800),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: width / 80,
                                                      height: height / 4,
                                                      color: DynamicColor()
                                                          .primarycolor,
                                                    ),
                                                    SizedBox(
                                                      width: width / 30,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Shift Type :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Shift_Type !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Shift_Type
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            25)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Present Days :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Present_Days !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Present_Days
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            23)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Absent Days :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Absent_Days !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Absent_Days
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            23)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Working Hours :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Working_Hours !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Working_Hours
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            23)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Hours Short :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Hours_Short !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Hours_Short
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            23)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Over Time :',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.77),
                                                                  fontSize:
                                                                      width /
                                                                          25),
                                                            ),
                                                            SizedBox(
                                                              width: width / 40,
                                                            ),
                                                            Text(
                                                                summaryController
                                                                            .summarylist[
                                                                                index]
                                                                            .Over_Time !=
                                                                        ""
                                                                    ? summaryController
                                                                        .summarylist[
                                                                            index]
                                                                        .Over_Time
                                                                    : '0',
                                                                style: GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        width /
                                                                            23)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Image.asset(
                                              "assets/1.gif",
                                              height: 500,
                                              width: 500,
                                            ),
                                          );
                                  }),
                            )
                          : Container(
                              padding: EdgeInsets.only(top: 150),
                              child: Text(
                                'Select Date From Calendar',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.77),
                                    fontSize: width / 20),
                              ),
                            ),
                    ],
                  );
                })),
      ),
    );
  }
}
