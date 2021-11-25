import 'dart:io';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';

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
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
            width: width,
            height: height,
            color: Colors.white,
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
                                          maxTime: DateTime(DateTime.now().year,
                                              DateTime.now().month, 30),

                                          //     onChanged: (date) {
                                          //   print('change $date');
                                          // },
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
                                              30), onConfirm: (date) {
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
                      Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (_, index) {
                              return DelayedDisplay(
                                fadeIn: true,
                                fadingDuration: Duration(milliseconds: 800),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFFFFFFFF),
                                          Color(0xFFFFFFFF),
                                          Color(0xFFFFFFFF),
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width / 80,
                                          height: height / 12,
                                          color: DynamicColor().primarycolor,
                                        ),
                                        SizedBox(
                                          width: width / 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Shift Type :',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      color: Colors.black
                                                          .withOpacity(0.77),
                                                      fontSize: width / 25),
                                                ),
                                                SizedBox(
                                                  width: width / 40,
                                                ),
                                                Text('Morning',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 25)),
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
                                                          FontWeight.w200,
                                                      color: Colors.black
                                                          .withOpacity(0.77),
                                                      fontSize: width / 25),
                                                ),
                                                SizedBox(
                                                  width: width / 40,
                                                ),
                                                Text('30',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 23)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
