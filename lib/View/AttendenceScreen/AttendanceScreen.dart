import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Controller/AttendenceController.dart';
import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttendanceScreen extends StatelessWidget {
  // const AttendanceScreen({Key? key}) : super(key: key);
  AttendanceController attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: width,
              height: height,
              child: GetBuilder(
                  init: attendanceController,
                  builder: (_) {
                    return Stack(
                      children: [
                        Image.asset(
                          'assets/attendancebg.png',
                          fit: BoxFit.cover,
                          width: width,
                          height: height,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 22.0, left: 22.0, top: 22.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Text(
                                    'Attendance',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 16),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            // DelayedDisplay(
                            //   fadeIn: true,
                            //   fadingDuration: Duration(milliseconds: 800),
                            //   child: Stack(
                            //     children: [
                            //       Center(
                            //         child: Image.asset(
                            //           'assets/summarybg.png',
                            //           fit: BoxFit.contain,
                            //           width: width / 1.1,
                            //         ),
                            //       ),
                            //       Row(
                            //         children: [
                            //           SizedBox(
                            //             width: width / 10,
                            //           ),
                            //           Text('Summary',
                            //               style: GoogleFonts.poppins(
                            //                   fontWeight: FontWeight.w300,
                            //                   fontSize: width / 21,
                            //                   color: DynamicColor().white)),
                            //           Spacer(),
                            //           Padding(
                            //             padding:
                            //                 const EdgeInsets.only(top: 10.0),
                            //             child: Image.asset(
                            //               'assets/summarycalendar.png',
                            //               height: height / 13,
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: width / 10,
                            //           ),
                            //         ],
                            //       ),
                            //       Positioned(
                            //         top: height / 12,
                            //         left: width / 10,
                            //         right: width / 20,
                            //         child: Row(
                            //           children: [
                            //             Container(
                            //               height: height / 22,
                            //               width: width / 7,
                            //               decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(5.0),
                            //                   color: DynamicColor()
                            //                       .primarycolor
                            //                       .withOpacity(0.40)),
                            //               child: Center(
                            //                 child: Text(
                            //                     summaryController
                            //                             .fromdate.value.day
                            //                             .toString() +
                            //                         " / " +
                            //                         summaryController
                            //                             .fromdate.value.month
                            //                             .toString(),
                            //                     style: GoogleFonts.poppins(
                            //                         fontWeight: FontWeight.w300,
                            //                         fontSize: width / 21,
                            //                         color:
                            //                             DynamicColor().white)),
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: width / 20,
                            //             ),
                            //             Text('to',
                            //                 style: GoogleFonts.poppins(
                            //                     fontWeight: FontWeight.w300,
                            //                     fontSize: width / 21,
                            //                     color: DynamicColor().white)),
                            //             SizedBox(
                            //               width: width / 20,
                            //             ),
                            //             Container(
                            //               height: height / 22,
                            //               width: width / 7,
                            //               decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(5.0),
                            //                   color: DynamicColor()
                            //                       .primarycolor
                            //                       .withOpacity(0.40)),
                            //               child: Center(
                            //                 child: Text(
                            //                     summaryController
                            //                             .todate.value.day
                            //                             .toString() +
                            //                         " / " +
                            //                         summaryController
                            //                             .todate.value.month
                            //                             .toString(),
                            //                     style: GoogleFonts.poppins(
                            //                         fontWeight: FontWeight.w300,
                            //                         fontSize: width / 21,
                            //                         color:
                            //                             DynamicColor().white)),
                            //               ),
                            //             ),
                            //             Spacer(),
                            //           ],
                            //         ),
                            //       ),
                            //       Positioned(
                            //         top: height / 7.75,
                            //         left: width / 2,
                            //         // right: width / 1.3,
                            //         child: GestureDetector(
                            //           onTap: () {
                            //             Get.offNamed('/summary');
                            //           },
                            //           child: Row(
                            //             children: [
                            //               Text(
                            //                 'See more Details',
                            //                 style: GoogleFonts.poppins(
                            //                     color: DynamicColor()
                            //                         .white
                            //                         .withOpacity(0.27),
                            //                     fontWeight: FontWeight.w400,
                            //                     fontSize: width / 22),
                            //               ),
                            //               SizedBox(
                            //                 width: width / 60,
                            //               ),
                            //               Icon(
                            //                 Icons.arrow_forward_ios,
                            //                 size: 17,
                            //                 color: Colors.white,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: height / 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.white),
                              padding: EdgeInsets.all(8.0),
                              child: attendanceController.sites.value == ""
                                  ? Icon(
                                      Icons.qr_code_sharp,
                                      color: Colors.black.withOpacity(0.75),
                                      size: width / 3,
                                    )
                                  : QrImage(
                                      data: attendanceController.sites.value,
                                      size: width / 3,
                                    ),
                            ),
                            SizedBox(
                              height: height / 35,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width / 15,
                                ),
                                Icon(Icons.location_on,
                                    size: width / 10,
                                    color: DynamicColor()
                                        .primarycolor
                                        .withOpacity(0.24)),
                                SizedBox(
                                  width: width / 30,
                                ),
                                Expanded(
                                  child: Text(
                                    attendanceController.sites.value != ""
                                        ? attendanceController.sites.value
                                        : 'Click on Qr Code',
                                    softWrap: false,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor()
                                            .black
                                            .withOpacity(0.27),
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 22),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 25,
                            ),
                            attendanceController.Loading.value == false
                                ? BaseUrl.storage.read("status") == false
                                    ? GestureDetector(
                                        onTap: () {
                                          attendanceController.clockin();
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 18.0),
                                          child: Container(
                                            width: width / 3,
                                            height: height / 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                    color: Color(0xFF44A6F4)
                                                        .withOpacity(0.48)),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Clock In',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 20),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 30,
                                                ),
                                                Center(
                                                  child: Image.asset(
                                                    'assets/clockIn.png',
                                                    height: height / 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          attendanceController.clockout();
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 18.0),
                                          child: Container(
                                            width: width / 3,
                                            height: height / 5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                    color: Color(0xFFF50000)
                                                        .withOpacity(0.46)),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Clock out',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: width / 20),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height / 30,
                                                ),
                                                Center(
                                                  child: Image.asset(
                                                    'assets/clockout.png',
                                                    height: height / 12,
                                                  ),
                                                ),
                                              ],
                                            ),
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
      ),
    );
  }
}
