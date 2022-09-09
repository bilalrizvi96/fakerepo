import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/RegistrationController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/ErrorLoading.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          // padding: EdgeInsets.only(right: 5, left: 10),
          // color: DynamicColor().white,
          child: GetBuilder(
              init: registrationController,
              builder: (_) {
                return registrationController.Loading.value == false
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: DelayedDisplay(
                                delay: Duration(milliseconds: 800),
                                slidingCurve: Curves.decelerate,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width / 15,
                                    ),
                                    Text(
                                      'Register Now',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: width / 14,
                                          color: DynamicColor().black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 5, left: 10),
                              child: Form(
                                key: registrationController.registrationFormKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: height / 4.5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Employee Code',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width / 30,
                                                color: DynamicColor().black),
                                          )),
                                    ),
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width / 80,
                                          height: height / 18,
                                          color: DynamicColor().primarycolor,
                                        ),
                                        Container(
                                          width: width / 1.22,
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: registrationController
                                                .employee_IdController,
                                            validator: registrationController
                                                .validators,
                                            cursorColor:
                                                DynamicColor().primarycolor,
                                            style: GoogleFonts.poppins(
                                                color:
                                                    DynamicColor().primarycolor,
                                                fontWeight: FontWeight.w600),
                                            decoration: new InputDecoration(
                                                hintText:
                                                    'Enter Your Employee Code',
                                                focusColor:
                                                    DynamicColor().primarycolor,
                                                hoverColor:
                                                    DynamicColor().primarycolor,
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: InputBorder.none),
                                            // keyboardType: TextInputType.none,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Email Address',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: width / 29,
                                                color: DynamicColor().black),
                                          )),
                                    ),
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: width / 80,
                                          height: height / 18,
                                          color: DynamicColor().primarycolor,
                                        ),
                                        Container(
                                          width: width / 1.22,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller: registrationController
                                                .emailController,
                                            validator: registrationController
                                                .validators,
                                            cursorColor:
                                                DynamicColor().primarycolor,
                                            style: GoogleFonts.poppins(
                                                color:
                                                    DynamicColor().primarycolor,
                                                fontWeight: FontWeight.w600),
                                            decoration: new InputDecoration(
                                                hintText: 'Enter Your Email',
                                                focusColor:
                                                    DynamicColor().primarycolor,
                                                hoverColor:
                                                    DynamicColor().primarycolor,
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 4,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        registrationController.registration();
                                      },
                                      child: Container(
                                        width: width / 1.2,
                                        height: height / 15,
                                        decoration: BoxDecoration(
                                            color: DynamicColor().primarycolor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          'Submit'.toUpperCase(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: DynamicColor().white),
                                        )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 50,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        width: width / 1.2,
                                        height: height / 15,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: DynamicColor().black),
                                            // color: DynamicColor().primarycolor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          'Sign In'.toUpperCase(),
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: DynamicColor().black),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ErrorLoading(height: 500.0, width: 500.0);
              })),
    );
  }
}
