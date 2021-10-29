import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FaceIDRuleScreen extends StatelessWidget {
  const FaceIDRuleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Positioned(
                width: width,
                left: width / 20,
                top: height / 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      'Face ID Rules',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: width / 15),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              DelayedDisplay(
                fadeIn: true,
                fadingDuration: Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0)),
                        color: Color(0xFFEBEFFF)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 400),
                      child: Container(
                        height: height / 5,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0)),
                            color: DynamicColor().primarycolor),
                      ),
                    ),
                    Positioned(
                      top: height / 12,
                      right: width / 12,
                      left: width / 12,
                      child: DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 800),
                        child: GestureDetector(
                          onTap: () {
                            Get.offNamed('/home');
                          },
                          child: Container(
                            width: width / 1.2,
                            height: height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: DynamicColor().white),
                                // color: DynamicColor().primarycolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Begin Verification'.toUpperCase(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: DynamicColor().white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: width / 10,
                left: width / 10,
                top: height / 5.5,
                child: Column(
                  children: [
                    DelayedDisplay(
                      fadeIn: true,
                      delay: Duration(milliseconds: 400),
                      child: Text(
                        'Follow SOPS to Verify Face ID',
                        style: GoogleFonts.poppins(
                            color: DynamicColor().primarycolor,
                            fontWeight: FontWeight.w500,
                            fontSize: width / 22),
                      ),
                    ),
                    SizedBox(
                      height: height / 13,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      delay: Duration(milliseconds: 800),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: height / 32,
                          ),
                          Container(
                              width: width / 4,
                              height: height / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFFFFFFFF),
                                      Color(0xFFFFFFFF),
                                    ],
                                  )),
                              child: Image.asset('assets/person.png')),
                          Spacer(),
                          Container(
                            width: width / 4,
                            height: height / 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                )),
                            child: Image.asset('assets/person.png'),
                          ),
                          SizedBox(
                            width: height / 32,
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      delay: Duration(milliseconds: 800),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Avoid wearing hats',
                            style: GoogleFonts.poppins(
                                color: DynamicColor().black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: width / 28),
                          ),
                          Text(
                            'Avoid wearing hats',
                            style: GoogleFonts.poppins(
                                color: DynamicColor().black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: width / 28),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: height / 35,
                        ),
                        DelayedDisplay(
                          fadeIn: true,
                          fadingDuration: Duration(milliseconds: 800),
                          child: Container(
                              width: width / 4,
                              height: height / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFFFFFFFF),
                                      Color(0xFFFFFFFF),
                                    ],
                                  )),
                              child: Image.asset('assets/person.png')),
                        ),
                        Spacer(),
                        DelayedDisplay(
                          fadeIn: true,
                          fadingDuration: Duration(milliseconds: 800),
                          child: Container(
                            width: width / 4,
                            height: height / 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                )),
                            child: Image.asset('assets/person.png'),
                          ),
                        ),
                        SizedBox(
                          width: height / 35,
                        ),
                        // Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Avoid wearing hats',
                            style: GoogleFonts.poppins(
                                color: DynamicColor().black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: width / 28),
                          ),
                          Text(
                            'Avoid wearing hats',
                            style: GoogleFonts.poppins(
                                color: DynamicColor().black.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                                fontSize: width / 28),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
