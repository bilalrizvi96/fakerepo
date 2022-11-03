import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/IntroController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Routes/Routes.dart';

class IntroScreen extends StatelessWidget {
  IntroController introController = Get.put(IntroController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
          init: introController,
          builder: (_) {
            return Container(
                width: width,
                height: height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(
                    children: [
                      PageView(
                        onPageChanged: (value) {
                          introController.pagechange(value);
                        },
                        controller: introController.controller.value,
                        children: <Widget>[
                          Container(
                            color: DynamicColor().white,
                            padding: EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DelayedDisplay(
                                  // slidingCurve: Curves.linear,
                                  fadingDuration: Duration(seconds: 1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFE9E9E9)
                                              .withOpacity(1.0),
                                          spreadRadius: 10,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/intro1.png',
                                      fit: BoxFit.cover,
                                      width: width / 1.3,
                                      height: height / 2.5,
                                      placeholder: (context, url) => Center(
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator())),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.image_not_supported_outlined),
                                    ),
                                    // Image.network(
                                    //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/intro1.png',
                                    //   fit: BoxFit.cover,
                                    //   width: width / 1.3,
                                    //   height: height / 2.5,
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 12.5,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    fadeIn: true,
                                    child: Container(
                                      width: width,
                                      height: height / 2.23,
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.only(
                                      //         topRight: Radius.circular(20.0),
                                      //         topLeft: Radius.circular(20.0)),
                                      //     color: DynamicColor().primarycolor),
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/introbottom.png',
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.image_not_supported_outlined),
                                              )
                                              // Image.network(
                                              //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/introbottom.png',
                                              //   fit: BoxFit.cover,
                                              // ),
                                              ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 100.0, left: 50),
                                            child: Text(
                                              'Digital Attendance',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 14,
                                                  color: DynamicColor().white),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 150.0,
                                                  right: 65,
                                                  left: 50),
                                              child: Text(
                                                'We are proud to announce the state-of-the-art "Digital Attendance" application for our organization. Just scan the QR Code and mark your attendance.  ',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: width / 24,
                                                    color: Color(0xFFF7F7F7)
                                                        .withOpacity(0.59)),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: DynamicColor().white,
                            padding: EdgeInsets.only(top: 9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DelayedDisplay(
                                  fadingDuration: Duration(seconds: 1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFE9E9E9)
                                              .withOpacity(1.0),
                                          spreadRadius: 10,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/intro2.png',
                                      fit: BoxFit.cover,
                                      width: width / 1.3,
                                      height: height / 2.5,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.image_not_supported_outlined),
                                    ),

                                    // Image.network(
                                    //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/intro2.png',
                                    //   fit: BoxFit.cover,
                                    //   width: width / 1.3,
                                    //   height: height / 2.5,
                                    // ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 12.5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DelayedDisplay(
                                    delay: Duration(milliseconds: 500),
                                    fadeIn: true,
                                    child: Container(
                                      width: width / 1,
                                      height: height / 2.23,
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.only(
                                      //         topRight: Radius.circular(20.0),
                                      //         topLeft: Radius.circular(20.0)),
                                      //     color: DynamicColor().primarycolor),
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/introbottom.png',
                                                fit: BoxFit.contain,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.image_not_supported_outlined),
                                              )
                                              // Image.network(
                                              //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/introbottom.png',
                                              //   fit: BoxFit.contain,
                                              // ),
                                              ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 100.0, left: 50),
                                            child: Text(
                                              'Register Your Identity',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 14,
                                                  color: DynamicColor().white),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 150.0,
                                                  right: 65,
                                                  left: 50),
                                              child: Text(
                                                'Your very first step towards Digital Attendance is to register yourself in this application. ',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: width / 24,
                                                    color: Color(0xFFF7F7F7)
                                                        .withOpacity(0.59)),
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              Get.offAllNamed(Routes.signinemp);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20.0, right: 20.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Container(
                                                  width: width / 7,
                                                  height: height / 15,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: DynamicColor()
                                                              .radiocolor
                                                              .withOpacity(0.6),
                                                          spreadRadius: 3,
                                                          blurRadius: 10,
                                                          offset: Offset(1,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      color: DynamicColor()
                                                          .primarycolor),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        fadeIn: true,
                        child: Align(
                          alignment: Alignment.center,
                          child: DotsIndicator(
                            dotsCount: 2,
                            position:
                                introController.pageIndex.value.toDouble(),
                            decorator: DotsDecorator(
                              activeColor: DynamicColor().primarycolor,
                              size: const Size.square(9.0),
                              activeSize: const Size(25.0, 5.0),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
