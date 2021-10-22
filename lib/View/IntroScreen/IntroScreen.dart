import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          color: DynamicColor().white,
          child: PageView(
            children: <Widget>[
              Container(
                color: DynamicColor().white,
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/intro1.png',
                      fit: BoxFit.cover,
                      height: height / 2.2,
                    ),
                    SizedBox(
                      height: height / 21,
                    ),
                    DotsIndicator(
                      dotsCount: 2,
                      position: 0,
                      decorator: DotsDecorator(
                        activeColor: DynamicColor().primarycolor,
                        size: const Size.square(9.0),
                        activeSize: const Size(25.0, 5.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 120.0),
                    //   child: Container(
                    //     width: 20,
                    //     height: 4,
                    //     decoration: BoxDecoration(
                    //         color: DynamicColor().primarycolor,
                    //         borderRadius: BorderRadius.circular(70.0)),
                    //   ),
                    // ),
                    SizedBox(
                      height: height / 90,
                    ),
                    Container(
                      width: width,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/introbottom.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 70),
                            child: Text(
                              'Digital Attendace',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 14,
                                  color: DynamicColor().white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 130.0, right: 65, left: 70),
                            child: Text(
                              'Emerging as one of the fastest-growing professional marketing concerns of Pakistan, Star Marketing (Pvt.) Ltd. is now considered the true market leader of innovative real-estate marketing',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: width / 30,
                                  color: Color(0xFFF7F7F7)),
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(top: 280.0, right: 20),
                          //   child: Align(
                          //     alignment: Alignment.bottomRight,
                          //     child: Container(
                          //       width: 60,
                          //       height: 60,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(50.0),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: DynamicColor()
                          //                   .titletextcolor
                          //                   .withOpacity(0.5),
                          //               spreadRadius: 3,
                          //               blurRadius: 10,
                          //               offset: Offset(
                          //                   0, 3), // changes position of shadow
                          //             ),
                          //           ],
                          //           color: DynamicColor().primarycolor),
                          //       child: Icon(
                          //         Icons.arrow_forward_ios,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: DynamicColor().white,
                padding: EdgeInsets.only(top: 9.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/intro2.png',
                      fit: BoxFit.cover,
                      height: height / 2.2,
                    ),
                    SizedBox(
                      height: height / 21,
                    ),
                    DotsIndicator(
                      dotsCount: 2,
                      position: 1,
                      decorator: DotsDecorator(
                        activeColor: DynamicColor().primarycolor,
                        size: const Size.square(9.0),
                        activeSize: const Size(25.0, 5.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40.0),
                    //   child: Container(
                    //     width: 20,
                    //     height: 4,
                    //     decoration: BoxDecoration(
                    //         color: DynamicColor().primarycolor,
                    //         borderRadius: BorderRadius.circular(70.0)),
                    //   ),
                    // ),
                    SizedBox(
                      height: height / 90,
                    ),
                    Container(
                      width: width,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/introbottom.png',
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, left: 70),
                            child: Text(
                              'Digital Attendace',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 14,
                                  color: DynamicColor().white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 140.0, right: 65, left: 75),
                            child: Text(
                              'Emerging as one of the fastest-growing professional marketing concerns of Pakistan,',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: width / 30,
                                  color: Color(0xFFF7F7F7)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/signin');
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 280.0, right: 20),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: DynamicColor()
                                              .titletextcolor
                                              .withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: DynamicColor().primarycolor),
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
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
