import 'dart:convert';

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
          color: Color(0xFFEBEFFF),
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
                        ? notificationController
                                .notificationlist.value.isNotEmpty
                            ? ListView.builder(
                                itemCount: notificationController
                                    .notificationlist.value.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                        right: 8.0,
                                        top: 8,
                                        left: 25,
                                        bottom: 8),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: width / 5,
                                            height: height / 8.5,
                                            decoration: BoxDecoration(
                                                color:
                                                    DynamicColor().primarycolor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            height: height / 8.5,
                                            width: width / 1.2,
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.fromBorderSide(
                                                    BorderSide(
                                                        color:
                                                            Color(0xFFDFDFDF))),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: width / 60,
                                                    ),
                                                    Text(
                                                      '${notificationController.notificationlist.value[index].title}',
                                                      style: GoogleFonts.poppins(
                                                          color: DynamicColor()
                                                              .primarycolor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: width / 25),
                                                    ),
                                                    Spacer(),
                                                    Text(
                                                      '${notificationController.notificationlist.value[index].time}',
                                                      style: GoogleFonts.poppins(
                                                          color: DynamicColor()
                                                              .primarycolor,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: width / 28),
                                                    ),
                                                    SizedBox(
                                                      width: width / 60,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height / 80,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      '${notificationController.notificationlist.value[index].message}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  DynamicColor()
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize:
                                                                  width / 30.2),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
