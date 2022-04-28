import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/NotificationController.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: GetBuilder(
              init: notificationController,
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: Colors.grey[600])),
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          'Notification',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 16),
                        ),
                        SizedBox(
                          width: width / 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    notificationController.Loading.value == false
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: notificationController
                                    .notificationlist.value.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height / 2.6,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: width / 1.2,
                                              height: height / 2.8,
                                              alignment: Alignment.topLeft,
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Color(0xFFE7EFFE)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ClipOval(
                                                    child: Image.asset(
                                                        'assets/oops.png',
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover),
                                                  ),
                                                  SizedBox(
                                                    width: width / 25,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '${BaseUrl.storage.read('name')}',
                                                        style: GoogleFonts.poppins(
                                                            color: DynamicColor()
                                                                .primarycolor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                width / 25),
                                                      ),
                                                      Text(
                                                        '${BaseUrl.storage.read('empCode')}',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize:
                                                                    width / 29),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: height / 9,
                                              child: Container(
                                                width: width / 1.2,
                                                height: height / 4.05,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.white),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: height / 40,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: width / 20,
                                                        ),
                                                        Icon(Icons.access_time,
                                                            size: width / 24,
                                                            color: Color(
                                                                0xFF57DDFF)),
                                                        SizedBox(
                                                          width: width / 40,
                                                        ),
                                                        Text(
                                                          '${notificationController.notificationlist.value[index].time}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      width /
                                                                          28),
                                                        ),
                                                        Spacer(),
                                                        Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            size: width / 24,
                                                            color: Color(
                                                                0xFF57DDFF)),
                                                        SizedBox(
                                                          width: width / 40,
                                                        ),
                                                        Text(
                                                          '${notificationController.notificationlist.value[index].date}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      width /
                                                                          28),
                                                        ),
                                                        SizedBox(
                                                          width: width / 15,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height / 80,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: width / 20,
                                                        ),
                                                        Icon(
                                                            Icons
                                                                .apartment_outlined,
                                                            size: width / 24,
                                                            color: Color(
                                                                0xFF57DDFF)),
                                                        SizedBox(
                                                          width: width / 40,
                                                        ),
                                                        Text(
                                                          '${notificationController.notificationlist.value[index].region}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      width /
                                                                          28),
                                                        ),
                                                        Spacer(),
                                                        Icon(Icons.logout,
                                                            size: width / 24,
                                                            color: Color(
                                                                0xFF57DDFF)),
                                                        SizedBox(
                                                          width: width / 40,
                                                        ),
                                                        Text(
                                                          '${notificationController.notificationlist.value[index].type}',
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      width /
                                                                          28),
                                                        ),
                                                        SizedBox(
                                                          width: width / 15,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height / 80,
                                                    ),
                                                    if (notificationController
                                                            .notificationlist
                                                            .value[index]
                                                            .reason !=
                                                        '')
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: width / 20,
                                                          ),
                                                          Icon(
                                                              Icons
                                                                  .help_outline,
                                                              size: width / 24,
                                                              color: Color(
                                                                  0xFF57DDFF)),
                                                          SizedBox(
                                                            width: width / 40,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              '${notificationController.notificationlist.value[index].reason}',
                                                              style: GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize:
                                                                      width /
                                                                          28),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width / 15,
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: height / 3.1,
                                              left: width / 2.4,
                                              child: Container(
                                                width: width / 2.4,
                                                height: height / 17,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: width / 10,
                                                      height: height / 17,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Color(
                                                              0xFF80B6FC)),
                                                      child: Icon(
                                                        Icons.attach_file,
                                                        color: Colors.white30,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      'View Document',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  width / 32),
                                                    ),
                                                    Spacer(),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Center(
                            child: Image.asset(
                              "assets/1.gif",
                              height: 200,
                              width: 200,
                            ),
                          ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
