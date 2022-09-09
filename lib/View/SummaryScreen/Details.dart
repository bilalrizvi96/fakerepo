import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/DynamicColor.dart';
import '../../Component/ErrorLoading.dart';
import '../../Controller/SummaryController.dart';

class Details extends StatelessWidget {
  Details({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    SummaryController _summaryController = Get.put(SummaryController());
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
                return _summaryController.Loading.value == false
                    ? Column(
                        children: [
                          _summaryController.summarydetaildata.value.isNotEmpty
                              ? ListView.builder(
                                  itemCount: _summaryController
                                      .summarydetaildata.value.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          right: 15.0,
                                          left: 15.0,
                                          top: 10,
                                          bottom: 10),
                                      child: DelayedDisplay(
                                        fadeIn: true,
                                        fadingDuration:
                                            Duration(milliseconds: 1200),
                                        child: Container(
                                          height: height / 5.5,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFFF2F2F2)),
                                            color: Color(int.parse("0xFF" +
                                                _summaryController
                                                    .summarydetaildata
                                                    .value[index]
                                                    .dayStatusColors
                                                    .color
                                                    .toString())),
                                            // _summaryController
                                            //             .summarydetaildata
                                            //             .value[index]
                                            //             .dayStatus !=
                                            //         "Annual"
                                            //     ? _summaryController
                                            //                 .summarydetaildata
                                            //                 .value[index]
                                            //                 .dayStatus !=
                                            //             "Sick"
                                            //         ? _summaryController
                                            //                     .summarydetaildata
                                            //                     .value[index]
                                            //                     .dayStatus !=
                                            //                 "Casual"
                                            //             ? _summaryController
                                            //                         .summarydetaildata
                                            //                         .value[
                                            //                             index]
                                            //                         .dayStatus !=
                                            //                     "Absent"
                                            //                 ? _summaryController.summarydetaildata.value[index].mobileDate.toString().split('-')[
                                            //                                 0] ==
                                            //                             DateTime.now()
                                            //                                 .day
                                            //                                 .toString() &&
                                            //                         _summaryController
                                            //                                 .summarydetaildata
                                            //                                 .value[index]
                                            //                                 .mobileDate
                                            //                                 .toString()
                                            //                                 .split('-')[1] ==
                                            //                             DateTime.now().month.toString()
                                            //                     ? Color(0xFF3C70BF)
                                            //                     : Color(0xFFF2F2F2)
                                            //                 : Color(0xFFE61756)
                                            //             : Color(0xFF1E7E2E)
                                            //         : Color(0xFF1E7E2E)
                                            //     : Color(0xFF1E7E2E),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(35.0),
                                              topLeft: Radius.circular(35.0),
                                              bottomLeft: Radius.circular(35.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: width / 35,
                                              ),
                                              Container(
                                                width: width / 4.5,
                                                height: height / 7.5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.30),
                                                          blurRadius: 12,
                                                          spreadRadius: 5,
                                                          offset: Offset(0, 1))
                                                    ],
                                                    color: Colors.white),
                                                child: SingleChildScrollView(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height / 50,
                                                      ),
                                                      Text(
                                                        '${_summaryController.summarydetaildata.value[index].date.toString().split('-')[2].split('T')[0]}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.5,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width / 22),
                                                      ),
                                                      SizedBox(
                                                        height: height / 50,
                                                      ),
                                                      Text(
                                                        '${_summaryController.summarydetaildata.value[index].dayInWords}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.5,
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    width / 21),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 0.5,
                                                        color: Color(int.parse("0xFF" +
                                                            _summaryController
                                                                .summarydetaildata
                                                                .value[index]
                                                                .dayStatusColors
                                                                .text
                                                                .toString())),
                                                        fontSize: width / 27),
                                                  ),
                                                  SizedBox(
                                                    height: height / 50,
                                                  ),
                                                  Text(
                                                    '${_summaryController.summarydetaildata.value[index].checkInDate}',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 0.5,
                                                        color: Color(int.parse("0xFF" +
                                                            _summaryController
                                                                .summarydetaildata
                                                                .value[index]
                                                                .dayStatusColors
                                                                .text
                                                                .toString())),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 0.5,
                                                        color: Color(int.parse("0xFF" +
                                                            _summaryController
                                                                .summarydetaildata
                                                                .value[index]
                                                                .dayStatusColors
                                                                .text
                                                                .toString())),
                                                        fontSize: width / 27),
                                                  ),
                                                  SizedBox(
                                                    height: height / 50,
                                                  ),
                                                  Text(
                                                    '${_summaryController.summarydetaildata.value[index].checkOutDate}',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: 0.5,
                                                        color: Color(int.parse("0xFF" +
                                                            _summaryController
                                                                .summarydetaildata
                                                                .value[index]
                                                                .dayStatusColors
                                                                .text
                                                                .toString())),
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
                                  })
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: height / 15,
                                    ),
                                    Image.asset('assets/nodatafound.png'),
                                    // Spacer(),
                                    Text(
                                      "No Data Found",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black.withOpacity(0.50),
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22),
                                    ),
                                    // Spacer(),
                                  ],
                                ),
                          SizedBox(
                            height: height / 50,
                          ),
                          _summaryController.summarydetaildata.value.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _summaryController.summaryPdf();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: width / 1.3,
                                      height: height / 15,
                                      decoration: BoxDecoration(
                                          color: DynamicColor().primarycolor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Export PDF'.toUpperCase(),
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            color: DynamicColor().white),
                                      )),
                                    ),
                                  ),
                                )
                              : Column(),
                          SizedBox(
                            height: height / 2,
                          ),
                        ],
                      )
                    : ErrorLoading(height: 200.0, width: 200.0);
              }),
        ),
      ),
    );
  }
}
