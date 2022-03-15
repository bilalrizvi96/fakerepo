import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/AttendenceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AttendanceScreen extends StatelessWidget {
  AttendanceController attendanceController = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        Image.network(
                          'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/attendancebg.png',
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
                                                  child: Image.network(
                                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockIn.png',
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
                                                  child: Image.network(
                                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/clockout.png',
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
