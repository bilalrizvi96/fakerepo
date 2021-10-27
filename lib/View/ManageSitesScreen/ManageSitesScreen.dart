import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SigninController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageSitesScreen extends StatelessWidget {
  SigninController signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          // padding: EdgeInsets.only(right: 5, left: 10),
          // color: DynamicColor().white,
          child: GetBuilder(
            init: signinController,
            builder: (_) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 800),
                        slidingCurve: Curves.decelerate,
                        child: Row(
                          children: [
                            Spacer(),
                            Container(
                              width: width / 3,
                              child: Text(
                                'Manage Sites',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 14,
                                    color: DynamicColor().black),
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              'assets/signinclock.png',
                              fit: BoxFit.cover,
                              height: height / 8,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0),
                      child: Container(
                        height: height / 500,
                        width: width / 1.65,
                        decoration: BoxDecoration(
                            color: Color(0xFFD1D1D1),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0, left: 330),
                      child: Container(
                        height: height / 500,
                        width: width / 8,
                        decoration: BoxDecoration(
                            color: Color(0xFFD1D1D1),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120.0, left: 390),
                      child: Container(
                        height: height / 500,
                        width: width / 16,
                        decoration: BoxDecoration(
                            color: DynamicColor().primarycolor,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 160),
                      child: Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(color: Color(0xFFEBEFFF)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 3.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Employee Id',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 30,
                                      color: DynamicColor().black),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 80,
                                height: height / 18,
                                color: DynamicColor().primarycolor,
                              ),
                              Container(
                                width: width / 1.22,
                                child: TextFormField(
                                  cursorColor: DynamicColor().primarycolor,
                                  style: GoogleFonts.poppins(
                                      color: DynamicColor().primarycolor,
                                      fontWeight: FontWeight.w600),
                                  decoration: new InputDecoration(
                                      hintText: 'Enter Your Employee ID',
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,

                                      // labelText: "Enter Employee ID",
                                      // labelStyle: ,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none

                                      //fillColor: Colors.green
                                      ),
                                  // keyboardType: TextInputType.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Pin Code',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 30,
                                      color: DynamicColor().black),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 80,
                                height: height / 18,
                                color: DynamicColor().primarycolor,
                              ),
                              Container(
                                width: width / 1.22,
                                child: TextFormField(
                                  obscureText: true,
                                  cursorColor: DynamicColor().primarycolor,
                                  style: GoogleFonts.poppins(
                                      color: DynamicColor().primarycolor,
                                      fontWeight: FontWeight.w600),
                                  decoration: new InputDecoration(
                                      hintText: 'Enter your pin code',
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,
                                      suffixIcon: Icon(
                                        Icons.lock_open,
                                        color: DynamicColor().primarycolor,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none),
                                  // keyboardType: TextInputType.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 4,
                          ),
                          Container(
                            width: width / 1.2,
                            height: height / 15,
                            decoration: BoxDecoration(
                                color: DynamicColor().primarycolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Submit',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: DynamicColor().white),
                            )),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Container(
                            width: width / 1.2,
                            height: height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: DynamicColor().black),
                                // color: DynamicColor().primarycolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'View Sites',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: DynamicColor().black),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
