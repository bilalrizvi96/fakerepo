import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/SignInEmployeeController.dart';
import 'package:attendencesystem/Trash/SigninController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SiginEmployeeScreen extends StatelessWidget {
  SignInEmployeeController signinController =
      Get.put(SignInEmployeeController());
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
            // padding: EdgeInsets.only(right: 5, left: 10),
            // color: DynamicColor().white,
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
                        Text(
                          'Sign in',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 14,
                              color: DynamicColor().black),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0)),
                        color: Color(0xFFEBEFFF)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10),
                  child: Form(
                    key: signinController.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Employee Id',
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width / 80,
                              height: height / 15,
                              color: DynamicColor().primarycolor,
                            ),
                            Container(
                              width: width / 1.22,
                              child: TextFormField(
                                controller: signinController.empcodeController,
                                // readOnly: true,
                                cursorColor: DynamicColor().primarycolor,
                                style: GoogleFonts.poppins(
                                    color: DynamicColor().primarycolor,
                                    fontWeight: FontWeight.w600),
                                decoration: new InputDecoration(
                                    labelText: 'Employee Code',
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
                          height: height / 20,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                signinController.imgFromCameras();
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: width / 3.2,
                                    height: height / 5.2,
                                    decoration: BoxDecoration(
                                      color: DynamicColor().white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, right: 15, left: 20),
                                    child: Image.asset(
                                      'assets/face.png',
                                      fit: BoxFit.scaleDown,
                                      height: height / 10,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 130.0, right: 40, left: 40),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
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
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () async {
                                final isAuthenticated =
                                    await signinController.authenticate();

                                if (isAuthenticated) {
                                  signinController.sigin();
                                } else {
                                  Get.snackbar(
                                      "Sign In", "Please try another methon");
                                }
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: width / 3.2,
                                    height: height / 5.2,
                                    decoration: BoxDecoration(
                                      color: DynamicColor().white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, right: 15, left: 20),
                                    child: Image.asset(
                                      'assets/finger.png',
                                      fit: BoxFit.scaleDown,
                                      height: height / 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 130.0, right: 40, left: 40),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
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
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: height / 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed('/home');
                          },
                          child: Container(
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
                        ),
                        SizedBox(
                          height: height / 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/registration');
                          },
                          child: Container(
                            width: width / 1.2,
                            height: height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(color: DynamicColor().black),
                                // color: DynamicColor().primarycolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Register'.toUpperCase(),
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
          ),
        ),
      ),
    );
  }
}
