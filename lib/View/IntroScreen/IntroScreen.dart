import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/IntroController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  IntroController introController = Get.put(IntroController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
          init: introController,
          builder: (_) {
            return SafeArea(
              child: Container(
                  width: width,
                  height: height,
                  // color: DynamicColor().white,
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
                            padding: EdgeInsets.only(top: 9.0),
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
                                    child: Image.asset(
                                      'assets/intro1.png',
                                      fit: BoxFit.cover,
                                      width: width / 1.3,
                                      height: height / 2.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 12.5,
                                ),
                                DelayedDisplay(
                                  delay: Duration(milliseconds: 500),
                                  fadeIn: true,
                                  child: Container(
                                    width: width,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/introbottom.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 80.0, left: 70),
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
                                                top: 130.0,
                                                right: 65,
                                                left: 70),
                                            child: Text(
                                              'Emerging as one of the fastest-growing professional marketing concerns of Pakistan, Star Marketing (Pvt.) Ltd. is now considered the true market leader of innovative real-estate marketing',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: width / 29,
                                                  color: Color(0xFFF7F7F7)
                                                      .withOpacity(0.59)),
                                            )),
                                      ],
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
                                    child: Image.asset(
                                      'assets/intro2.png',
                                      fit: BoxFit.cover,
                                      width: width / 1.3,
                                      height: height / 2.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 12.5,
                                ),
                                // SizedBox(
                                //   height: height / 50,
                                // ),
                                DelayedDisplay(
                                  delay: Duration(milliseconds: 500),
                                  fadeIn: true,
                                  child: Container(
                                    width: width,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/introbottom.png',
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 80.0, left: 70),
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
                                              top: 130.0, right: 65, left: 70),
                                          child: Text(
                                            "Emerging as one of the fastest-growing professional marketing concerns of Pakistan,",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w300,
                                                fontSize: width / 30,
                                                color: Color(0xFFF7F7F7)
                                                    .withOpacity(0.59)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/signinemp');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 280.0, left: 320),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
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
                                                  color: DynamicColor()
                                                      .primarycolor),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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
                  )),
            );
          }),
    );
  }
}
// Padding(
// padding: const EdgeInsets.all(8),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Container(
// margin: EdgeInsets.all(2.0),
// height: 8,
// width: 8,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: pageIndex == 0
// ? Color.fromRGBO(243, 76, 67, 1)
// : Color.fromRGBO(243, 76, 67, 0.16)),
// ),
// Container(
// margin: EdgeInsets.all(2.0),
// height: 8,
// width: 8,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: pageIndex == 1
// ? Color.fromRGBO(243, 76, 67, 1)
// : Color.fromRGBO(243, 76, 67, 0.16)),
// ),
// Container(
// margin: EdgeInsets.all(2),
// height: 8,
// width: 8,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: pageIndex == 2
// ? Color.fromRGBO(243, 76, 67, 1)
// : Color.fromRGBO(243, 76, 67, 0.16)),
// ),
// // Container(
// //   margin: EdgeInsets.all(2.0),
// //   height: 8,
// //   width:8,                            decoration: BoxDecoration(
// //     shape: BoxShape.circle,
// //     color: pageIndex == 3
// //         ? Color.fromRGBO(243, 76, 67, 1)
// //         : Color.fromRGBO(243, 76, 67, 0.16)
// // ),
// // )
// ],
// ),
// ),
