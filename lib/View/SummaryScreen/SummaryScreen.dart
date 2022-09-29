import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Component/ErrorLoading.dart';
import '../../Component/NoInternet.dart';
import '../../Controller/SignInEmployeeController.dart';
import '../../Routes/Routes.dart';
import 'Analytics.dart';
import 'Details.dart';
import 'Guideline.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({
    Key? key,
  }) : super(key: key);
  SummaryController summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    summaryController.check();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
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
                return summaryController.connection == true
                    ? SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
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
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     summaryController.init();
                                    //   },
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(
                                    //         right: 6.0, left: 10.0),
                                    //     child: Icon(
                                    //       Icons.refresh_sharp,
                                    //       size: width / 16,
                                    //       color: DynamicColor().primarycolor,
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: width / 50,
                                    // ),
                                    GestureDetector(
                                      onTap: () {
                                        BaseUrl.storage.write("token", "out");
                                        Get.offAllNamed(Routes.signinemp);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 2.0, left: 10.0),
                                        child: Icon(
                                          Icons.logout,
                                          size: width / 16,
                                          color: Color(0xFFEC4A22),
                                        ),
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

                                        DatePicker.showDatePicker(
                                          context,
                                          minTime: DateTime(
                                              int.parse(summaryController.year),
                                              int.parse(
                                                  summaryController.month),
                                              int.parse(summaryController.day)),
                                          maxTime: DateTime.now(),
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            summaryController.toDate(date);
                                          },
                                          currentTime: DateTime.now(),
                                          locale: LocaleType.en,
                                        );
                                      },
                                      child: Container(
                                        height: height / 19,
                                        width: width / 2.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.topRight,
                                              colors: DynamicColor().gradient),
                                        ),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            CachedNetworkImage(
                                              imageUrl:
                                                  'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarycalendar.png',
                                              height: height / 25,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            // Image.network(
                                            //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarycalendar.png',
                                            //   height: height / 25,
                                            // ),
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
                                            Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Colors.white),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),

                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.mypoints);
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: width / 8,
                                            height: height / 19,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFEC4A22)),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    topLeft:
                                                        Radius.circular(10.0))),
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
                                              border: Border.all(
                                                  color: Color(0xFFEC4A22)),
                                              color: Color(0xFFEC4A22),
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(10.0)),
                                            ),
                                            child: Text(
                                              BaseUrl.storage
                                                  .read("points")
                                                  .toString(),
                                              // summaryController.summarydata.isNotEmpty
                                              //     ? '${summaryController.summarydata.value[0].points}'
                                              //     : '0',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 24),
                                            ),
                                          )
                                        ],
                                      ),
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
                                                itemCount: summaryController
                                                    .weeklist.length,
                                                scrollDirection:
                                                    Axis.horizontal,
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
                                                          "Week " +
                                                              '${index + 1}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.50),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      width /
                                                                          32),
                                                        ),
                                                        SizedBox(
                                                          height: height / 50,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            summaryController
                                                                .weekSelection(
                                                                    index);
                                                          },
                                                          child: Container(
                                                            width: width / 5.5,
                                                            height: height / 25,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: summaryController
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
                                                                        colors:
                                                                            DynamicColor().gradient),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                    // border: Border.all(
                                                                    //     color: Colors.black)
                                                                  ),
                                                            child: Text(
                                                              summaryController
                                                                  .weeklist[
                                                                      index]
                                                                  .range,
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  letterSpacing:
                                                                      0.5,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      width /
                                                                          25),
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
                                  unselectedLabelColor:
                                      DynamicColor().titletextcolor,

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
                                      summaryController.Loading.value != true
                                          ? Analytics(
                                              width: width, height: height)
                                          : ErrorLoading(
                                              height: 200.0, width: 200.0),
                                      summaryController.Loading.value != true
                                          ? Details(
                                              height: height, width: width)
                                          : ErrorLoading(
                                              height: 200.0, width: 200.0),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(child: NoInternet(height: height, width: width));
              }),
        ),
      ),
    );
  }
}
