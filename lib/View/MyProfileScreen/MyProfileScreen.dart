import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SigninController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileScreen extends StatelessWidget {
  SigninController signinController = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: width,
            height: height,
            color: Color(0xFFEBEFFF),
            padding: EdgeInsets.only(top: 15.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 35.0,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'First Name',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,

                                // labelText: "Enter First Name",
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
                            'Last Name',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,
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
                      padding: const EdgeInsets.only(
                        left: 35.0,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mobile',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,

                                // labelText: "Enter First Name",
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
                            'Designation',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,
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
                      padding: const EdgeInsets.only(
                        left: 35.0,
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Date of Joining',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,

                                // labelText: "Enter First Name",
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
                            'Address',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,
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
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email Address',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,
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
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Shift Timings',
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
                                hintText: '',
                                focusColor: DynamicColor().primarycolor,
                                hoverColor: DynamicColor().primarycolor,
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                            // keyboardType: TextInputType.none,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: width / 1.2,
                      height: height / 15,
                      decoration: BoxDecoration(
                          color: DynamicColor().primarycolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Next'.toUpperCase(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: DynamicColor().white),
                      )),
                    ),
                    Spacer(),
                  ],
                ),
                // Stack(
                //   children: [
                //     Container(
                //       height: height / 5,
                //       color: Color(0xFFEBEFFF),
                //     ),
                //     Positioned(
                //       top: height / 12,
                //       left: width / 15,
                //       right: width / 18,
                //       child:
                //     ),
                //   ],
                // ),
              ],
            )),
      ),
    );
  }
}
