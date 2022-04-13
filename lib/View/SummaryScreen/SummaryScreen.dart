import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:slider_button/slider_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({
    Key? key,
  }) : super(key: key);

  SummaryController summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: width,
            height: height,
            color: Colors.white,
            padding: EdgeInsets.only(
              right: 20.0,
              left: 22.0,
            ),
            child: GetBuilder(
                init: summaryController,
                builder: (_) {
                  return SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 5.0,
                            left: 5.0,
                          ),
                          child: Row(
                            children: [
                              // SizedBox(
                              //   width: width / 20,
                              // ),
                              Text(
                                'Summary',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 16),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  BaseUrl.storage.write("token", "out");
                                  Get.offAllNamed('/signinemp');
                                },
                                child: Icon(
                                  Icons.logout,
                                  size: width / 16,
                                  color: Color(0xFFEC4A22),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 5.0,
                            left: 5.0,
                          ),
                          child: Row(
                            children: [
                              // SizedBox(
                              //   width: width / 30,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  print(summaryController.day +
                                      '-' +
                                      summaryController.month +
                                      '-' +
                                      summaryController.year);
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) => Container(
                                            height: 400,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 300,
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    minimumDate: DateTime(
                                                      int.parse(
                                                          summaryController
                                                              .year),
                                                      int.parse(
                                                          summaryController
                                                              .month),
                                                      int.parse(
                                                          summaryController
                                                              .day),
                                                    ),
                                                    initialDateTime:
                                                        DateTime.now(),
                                                    maximumDate:
                                                        DateTime(2022, 12, 31),
                                                    // minimumDate: summaryController.mindate,
                                                    onDateTimeChanged:
                                                        (DateTime value) {
                                                      summaryController
                                                          .toDate(value);
                                                    },
                                                  ),
                                                ),

                                                // Close the modal
                                                CupertinoButton(
                                                  child: const Text('OK'),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                )
                                              ],
                                            ),
                                          ));

                                  // DatePickerWidget(
                                  //   initialDateTime: DateTime.now(),
                                  //   // dateFormat: ,
                                  //   minDateTime: summaryController.mindate,
                                  //   maxDateTime: DateTime(
                                  //       DateTime.now().year - 1,
                                  //       DateTime.now().month + 12,
                                  //       1),
                                  //   onConfirm: (date, val) {
                                  //     summaryController.toDate(date);
                                  //   },
                                  // );
                                  // DatePicker.showDatePicker(
                                  //   context,
                                  //   minTime:
                                  //       DateTime.parse('2022-04-12 00:00:00'),
                                  //   maxTime: DateTime(DateTime.now().year - 1,
                                  //       DateTime.now().month + 12, 1),
                                  //   showTitleActions: true,
                                  //   onConfirm: (date) {
                                  //     summaryController.toDate(date);
                                  //   },
                                  //   currentTime: DateTime.now(),
                                  //   locale: LocaleType.en,
                                  // );
                                },
                                child: Container(
                                  height: height / 19,
                                  width: width / 2.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.topRight,
                                        colors: DynamicColor().gradient),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(-2,
                                            0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Image.network(
                                        'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarycalendar.png',
                                        height: height / 25,
                                      ),
                                      Spacer(),
                                      Text(
                                        summaryController.selectedmonths
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: width / 30),
                                      ),
                                      Spacer(),
                                      Icon(Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),

                              Spacer(),
                              Row(
                                children: [
                                  Container(
                                    width: width / 8,
                                    height: height / 19,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFEC4A22)),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0))),
                                    child: Icon(
                                      Icons.stars_rounded,
                                      color: Color(0xFFEC4A22),
                                    ),
                                  ),
                                  Container(
                                    width: width / 8,
                                    height: height / 19,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFEC4A22)),
                                      color: Color(0xFFEC4A22),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0)),
                                    ),
                                    child: Text(
                                      summaryController.summarydata.isNotEmpty
                                          ? '${summaryController.summarydata.value[0].points}'
                                          : '0',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 24),
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                      InformationBottom(
                                          height: height, width: width),
                                      elevation: 20.0,
                                      enableDrag: false,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      )));

                                  // BaseUrl.storage.write("token", "out");
                                  // Get.offAllNamed('/signinemp');
                                },
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  size: width / 15,
                                  color: Color(0xFFEC4A22),
                                ),
                              ),
                              // Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        if (summaryController.weeklist.value.isNotEmpty)
                          summaryController.tabindex.value == 0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    right: 5.0,
                                    left: 5.0,
                                  ),
                                  child: DelayedDisplay(
                                    fadeIn: true,
                                    fadingDuration:
                                        Duration(milliseconds: 1200),
                                    child: Container(
                                      height: height / 10,
                                      child: ListView.builder(
                                          itemCount:
                                              summaryController.weeklist.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder: (_, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                right: 5.0,
                                                left: 5.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Week " + '${index + 1}',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.black
                                                            .withOpacity(0.50),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 32),
                                                  ),
                                                  SizedBox(
                                                    height: height / 50,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      summaryController
                                                          .weekSelection(index);
                                                    },
                                                    child: Container(
                                                      width: width / 5.5,
                                                      height: height / 25,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          summaryController
                                                                      .weeklist
                                                                      .value[
                                                                          index]
                                                                      .selected ==
                                                                  true
                                                              ? BoxDecoration(
                                                                  gradient: LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .topRight,
                                                                      colors: DynamicColor()
                                                                          .gradient),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                  // border: Border.all(
                                                                  //     color: Colors.black)
                                                                )
                                                              : BoxDecoration(
                                                                  color: Color(
                                                                      0xFFDBE3FF),
                                                                  // gradient: LinearGradient(
                                                                  //     begin: Alignment.topCenter,
                                                                  //     end: Alignment.topRight,
                                                                  //     colors:
                                                                  //     DynamicColor().gradient),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                  // border: Border.all(
                                                                  //     color: Colors.black)
                                                                ),
                                                      child: Text(
                                                        summaryController
                                                            .weeklist[index]
                                                            .range,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                letterSpacing:
                                                                    0.5,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    width / 25),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                )
                              : Column(),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 5.0,
                            left: 5.0,
                          ),
                          child: TabBar(
                            controller: summaryController.tabController,
                            // give the indicator a decoration (color and border radius)
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.topRight,
                                  colors: DynamicColor().gradient),
                            ),
                            labelColor: Colors.white,

                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold),
                            unselectedLabelColor: DynamicColor().titletextcolor,

                            tabs: [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                text: "Analytics",
                              ),

                              // second tab [you can add an icon using the icon property]
                              Tab(
                                text: 'Details',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 5.0,
                            left: 5.0,
                          ),
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.20)),
                            ),
                            padding: EdgeInsets.all(1.0),
                            child: TabBarView(
                              controller: summaryController.tabController,
                              children: [
                                Analytics(width: width, height: height),
                                Details(height: height, width: width),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  SummaryController _summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5.0,
        left: 5.0,
      ),
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: GetBuilder(
              init: _summaryController,
              builder: (_) {
                return Column(
                  children: [
                    ListView.builder(
                        itemCount:
                            _summaryController.summarydetaildata.value.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: 15.0, left: 15.0, top: 10, bottom: 10),
                            child: DelayedDisplay(
                              fadeIn: true,
                              fadingDuration: Duration(milliseconds: 1200),
                              child: Container(
                                height: height / 5.5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFF2F2F2)),
                                  color: _summaryController.summarydetaildata
                                              .value[index].dayStatus !=
                                          "Absent"
                                      ? Color(0xFFF2F2F2)
                                      : Color(0xFFE61756),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.0),
                                    topLeft: Radius.circular(35.0),
                                    bottomLeft: Radius.circular(35.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width / 35,
                                    ),
                                    Container(
                                      width: width / 4.5,
                                      height: height / 7.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.30),
                                                blurRadius: 12,
                                                spreadRadius: 5,
                                                offset: Offset(0, 1))
                                          ],
                                          color: Colors.white),
                                      child: SingleChildScrollView(
                                        physics: NeverScrollableScrollPhysics(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: height / 50,
                                            ),
                                            Text(
                                              '${index + 1}',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.5,
                                                  color: Colors.black,
                                                  fontSize: width / 22),
                                            ),
                                            SizedBox(
                                              height: height / 50,
                                            ),
                                            Text(
                                              '${_summaryController.summarydetaildata.value[index].dayInWords}',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 0.5,
                                                  color: Colors.black,
                                                  fontSize: width / 21),
                                            ),
                                            SizedBox(
                                              height: height / 50,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Clock In',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                              color: _summaryController
                                                          .summarydetaildata
                                                          .value[index]
                                                          .dayStatus !=
                                                      "Absent"
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: width / 27),
                                        ),
                                        SizedBox(
                                          height: height / 50,
                                        ),
                                        Text(
                                          '${_summaryController.summarydetaildata.value[index].checkInDate}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                              color: _summaryController
                                                          .summarydetaildata
                                                          .value[index]
                                                          .dayStatus !=
                                                      "Absent"
                                                  ? Color(0XFF5B5B5B)
                                                  : Colors.white,
                                              fontSize: width / 25),
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
                                        Text(
                                          'Clock Out',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5,
                                              color: _summaryController
                                                          .summarydetaildata
                                                          .value[index]
                                                          .dayStatus !=
                                                      "Absent"
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: width / 27),
                                        ),
                                        SizedBox(
                                          height: height / 50,
                                        ),
                                        Text(
                                          '${_summaryController.summarydetaildata.value[index].checkOutDate}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5,
                                              color: _summaryController
                                                          .summarydetaildata
                                                          .value[index]
                                                          .dayStatus !=
                                                      "Absent"
                                                  ? Color(0XFF5B5B5B)
                                                  : Colors.white,
                                              fontSize: width / 25),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: height / 50,
                    ),
                    _summaryController.summarydetaildata.value.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.12),
                                ),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: SliderButton(
                              height: 70.0,
                              radius: 50.0,
                              dismissible: true,
                              disable: false,
                              width: width / 1.2,
                              buttonColor: DynamicColor().primarycolor,
                              vibrationFlag: true,
                              backgroundColor: Colors.white.withOpacity(0.25),
                              baseColor: Colors.red,
                              action: () {
                                Get.back();
                              },
                              label: Text(
                                "Swipe right to export pdf",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFFAFAFAF).withOpacity(0.25),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Column(),
                    SizedBox(
                      height: height / 2,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class Analytics extends StatelessWidget {
  Analytics({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  SummaryController _summaryController = Get.put(SummaryController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: GetBuilder(
              init: _summaryController,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    if (_summaryController.weeklist.value.isNotEmpty)
                      _summaryController
                                  .weeklist
                                  .value[_summaryController.weekupdate.value]
                                  .weekdata[0]
                                  .message ==
                              'Data found with alert'
                          ? DelayedDisplay(
                              fadeIn: true,
                              child: Container(
                                width: width / 1.2,
                                height: height / 5,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: 30, right: 25.0, left: 25.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: NetworkImage(_summaryController
                                            .weeklist
                                            .value[_summaryController
                                                .weekupdate.value]
                                            .weekdata[0]
                                            .alert
                                            .imageUrl),
                                        fit: BoxFit.cover)),
                                child: Text(
                                  _summaryController
                                      .weeklist
                                      .value[
                                          _summaryController.weekupdate.value]
                                      .weekdata[0]
                                      .alert
                                      .message,
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 27),
                                ),
                              ),
                            )
                          : Column(),
                    SizedBox(
                      height: height / 50,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: width / 1.5,
                              height: height / 5,
                              padding: EdgeInsets.only(left: 70, right: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF4F9FF),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Transform.rotate(
                                      angle: 9.4,
                                      child: Text(
                                        ',,',
                                        maxLines: 4,
                                        style: GoogleFonts.poppins(
                                            color: Color(0XFFBACADC),
                                            fontWeight: FontWeight.w500,
                                            fontSize: width / 7),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _summaryController
                                              .summarydata.value.isNotEmpty
                                          ? ' ${_summaryController.summarydata.value[0].messages.message}'
                                          : '',
                                      maxLines: 4,
                                      style: GoogleFonts.poppins(
                                          color: Color(0XFF1B236B),
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 27),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      ',,',
                                      maxLines: 4,
                                      style: GoogleFonts.poppins(
                                          color: Color(0XFFBACADC),
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Container(
                                width: width / 3.5,
                                height: height / 6.5,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.10),
                                        spreadRadius: -12.0,
                                        blurRadius: 12.0,
                                      ),
                                    ],
                                    color: _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? Color(int.parse(_summaryController
                                            .summarydata
                                            .value[0]
                                            .messages
                                            .color))
                                        : Color(0xFFFFF9DF),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 50,
                                    ),
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? Image.network(
                                            _summaryController.summarydata
                                                .value[0].messages.imageUrl,
                                            fit: BoxFit.scaleDown,
                                            width: width / 12,
                                          )
                                        : Column(),
                                    SizedBox(
                                      height: height / 50,
                                    ),
                                    Text(
                                      'Shift',
                                      style: GoogleFonts.poppins(
                                          color: _summaryController
                                                  .summarydata.value.isNotEmpty
                                              ? Color(int.parse(
                                                  _summaryController
                                                      .summarydata
                                                      .value[0]
                                                      .messages
                                                      .textcolor))
                                              : Color(0xFFFFF9DF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 28),
                                    ),
                                    Text(
                                      _summaryController
                                              .summarydata.value.isNotEmpty
                                          ? '${_summaryController.summarydata.value[0].messages.shiftType}'
                                          : '',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          color: _summaryController
                                                  .summarydata.value.isNotEmpty
                                              ? Color(int.parse(
                                                  _summaryController
                                                      .summarydata
                                                      .value[0]
                                                      .messages
                                                      .textcolor))
                                              : Color(0xFFFFF9DF),
                                          fontStyle: FontStyle.italic,
                                          fontSize: width / 28),
                                    ),
                                    SizedBox(
                                      height: height / 50,
                                    ),
                                  ],
                                ),
                              ),
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
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Container(
                            width: width / 3.7,
                            height: height / 7,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeAnnualLeaves
                                          .toString())
                                      : 0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].annualLeaves
                                          .toString())
                                      : 20,
                                  startAngle: width / 1.5,
                                  endAngle: width / 1.5,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.6,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothFlat,
                                      color: Color(0xFFCFE4FE),
                                      thickness: width / 45),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeAnnualLeaves
                                                .toString())
                                            : 0,
                                        cornerStyle: CornerStyle.bothFlat,
                                        width: width / 45,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        color: DynamicColor().primarycolor,
                                        gradient: SweepGradient(colors: <Color>[
                                          DynamicColor().primarycolor,
                                          DynamicColor().primarycolor
                                        ], stops: <double>[
                                          0.25,
                                          0.75
                                        ])),
                                    MarkerPointer(
                                        value: 2,
                                        enableDragging: true,
                                        //onValueChanged: onVolumeChanged,
                                        markerHeight: 20,
                                        markerWidth: 20,
                                        markerType: MarkerType.image,
                                        color: Color(0XFFFFAB40),
                                        borderWidth: 2,
                                        borderColor: Color(0XFFFFAB40))
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 0.1,
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeAnnualLeaves.toString() + '/' + _summaryController.summarydata.value[0].annualLeaves.toString()}'
                                                : "${0 / 0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: DynamicColor()
                                                    .primarycolor))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.0, bottom: 5),
                                        child: Text('Annual Leave',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                                color:
                                                    DynamicColor().primarycolor,
                                                fontSize: width / 36)),
                                      ),
                                    )
                                  ])
                            ]),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 7,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeAnnualLeaves
                                          .toString())
                                      : 0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].sickLeaves
                                          .toString())
                                      : 20,
                                  startAngle: width / 1.5,
                                  endAngle: width / 1.5,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.6,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothFlat,
                                      color: Color(0xFFCFE4FE),
                                      thickness: width / 45),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeAnnualLeaves
                                                .toString())
                                            : 0,
                                        cornerStyle: CornerStyle.bothFlat,
                                        width: width / 45,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        color: DynamicColor().primarycolor,
                                        gradient: SweepGradient(colors: <Color>[
                                          Color(0xFFEC4A22),
                                          Color(0xFFEC4A22)
                                        ], stops: <double>[
                                          0.25,
                                          0.75
                                        ])),
                                    MarkerPointer(
                                        value: 0,
                                        enableDragging: true,
                                        //onValueChanged: onVolumeChanged,
                                        markerHeight: 20,
                                        markerWidth: 20,
                                        markerType: MarkerType.image,
                                        color: Color(0XFFFFAB40),
                                        borderWidth: 2,
                                        borderColor: Color(0XFFFFAB40))
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 40,
                                        positionFactor: 0.1,
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeSickLeaves.toString() + '/' + _summaryController.summarydata.value[0].sickLeaves.toString()}'
                                                : "${0 / 0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFEC4A22)))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                          padding: EdgeInsets.only(
                                              top: 40.0, bottom: 5),
                                          child: Text('Sick Leave',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1,
                                                  color: Colors.red,
                                                  fontSize: width / 36))),
                                    )
                                  ])
                            ]),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 7,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeCasualLeaves
                                          .toString())
                                      : 0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].casualLeaves
                                          .toString())
                                      : 20,
                                  startAngle: width / 1.5,
                                  endAngle: width / 1.5,
                                  showLabels: false,
                                  showTicks: false,
                                  radiusFactor: 0.6,
                                  axisLineStyle: AxisLineStyle(
                                      cornerStyle: CornerStyle.bothFlat,
                                      color: Color(0xFFCFE4FE),
                                      thickness: width / 45),
                                  pointers: <GaugePointer>[
                                    RangePointer(
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeCasualLeaves
                                                .toString())
                                            : 0,
                                        cornerStyle: CornerStyle.bothFlat,
                                        width: width / 45,
                                        sizeUnit: GaugeSizeUnit.logicalPixel,
                                        color: DynamicColor().primarycolor,
                                        gradient: SweepGradient(colors: <Color>[
                                          Colors.deepPurple,
                                          Colors.deepPurple,
                                        ], stops: <double>[
                                          0.25,
                                          0.75
                                        ])),
                                    MarkerPointer(
                                        value: 2,
                                        enableDragging: true,
                                        //onValueChanged: onVolumeChanged,
                                        markerHeight: 20,
                                        markerWidth: 20,
                                        markerType: MarkerType.image,
                                        color: Color(0XFFFFAB40),
                                        borderWidth: 2,
                                        borderColor: Color(0XFFFFAB40))
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                        angle: 90,
                                        axisValue: 5,
                                        positionFactor: 0.1,
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeCasualLeaves.toString() + '/' + _summaryController.summarydata.value[0].casualLeaves.toString()}'
                                                : "${0 / 0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                          padding: EdgeInsets.only(
                                              top: 40.0, bottom: 5),
                                          child: Text('Casual Leave',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1,
                                                  color: Colors.deepPurple,
                                                  fontSize: width / 36))),
                                    )
                                  ])
                            ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCDDBFA)),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Presents',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFE7EEFE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthPresentDays}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: DynamicColor().primarycolor,
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFE7EEFE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekPresentDays}'
                                        : "0",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: DynamicColor().primarycolor,
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFCDDBFA)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Absents',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFFEF5E4)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthAbsentDays}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDC3810),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFFEF5E4)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekAbsentDays}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFDC3810),
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCDDBFA)),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Target',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFF0FEE4)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthTargetedHours}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF6D8459),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFF0FEE4)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekTargetedHours}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF6D8459),
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
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
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCDDBFA)),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Work Hours',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFFBE4FE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthHoursWorked}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFFA24AAE),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFFBE4FE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekHoursWorked}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFFA24AAE),
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFCDDBFA)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Short Hours',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFEBE4FE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthShortHours}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFAE1CE4),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFEBE4FE)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekShortHours}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFAE1CE4),
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width / 3.7,
                            height: height / 2.5,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCDDBFA)),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Over Time',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFE7FEEB)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthOverTime}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1AC137),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Week',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0XFFE7FEEB)),
                                  child: Text(
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[0].weekdata[0].weekOverTime}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1AC137),
                                        fontSize: width / 27),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 2,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class InformationBottom extends StatelessWidget {
  InformationBottom({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  SummaryController _summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height / 14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topRight,
                colors: DynamicColor().gradient),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width / 10,
              ),
              Text(
                'Points Guideline',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: width / 20),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: width / 12,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: width / 12,
                ),
              ),
              SizedBox(
                width: width / 15,
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 50,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: _summaryController.pointlist.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 30.0,
                      left: 30.0,
                    ),
                    child: Container(
                      height: height / 7,
                      // decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Color(0xFFD0E4FA),
                      //         offset: Offset(
                      //           5.0,
                      //           5.0,
                      //         ),
                      //         blurRadius: 10,
                      //         spreadRadius: -2,
                      //       ), //BoxShadow
                      //       BoxShadow(
                      //         color: Colors.white,
                      //         offset: Offset(0.0, 0.0),
                      //         blurRadius: 0.0,
                      //         spreadRadius: 0.0,
                      //       ), //BoxShadow
                      //     ],
                      //     borderRadius: BorderRadius.circular(10.0),
                      //     border:
                      //         Border.all(color: DynamicColor().primarycolor)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width / 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                _summaryController.pointlist[index].Title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: width / 26),
                              ),
                              Container(
                                width: width / 2,
                                child: Text(
                                  _summaryController
                                      .pointlist[index].decription,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: width / 31),
                                ),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: width / 8,
                            height: height / 19,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _summaryController
                                      .pointlist[index].textcolor),
                              color: _summaryController.pointlist[index].color,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              _summaryController.pointlist[index].point,
                              style: GoogleFonts.poppins(
                                  color: _summaryController
                                      .pointlist[index].textcolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 24),
                            ),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
