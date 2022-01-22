import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/OTPController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  OTPController otpController = Get.put(OTPController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: otpController,
            builder: (_) {
              return Container(
                  height: height,
                  width: width,
                  child: Stack(
                    children: [
                      Positioned(
                        width: width / 5,
                        left: width / 20,
                        top: height / 40,
                        child: Text(
                          'OTP',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: DelayedDisplay(
                          delay: Duration(milliseconds: 400),
                          slidingCurve: Curves.decelerate,
                          child: Image.asset(
                            'assets/otpbg.png',
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width / 20,
                        top: height / 6,
                        child: Image.asset(
                          'assets/OTPphone.png',
                          fit: BoxFit.cover,
                          // width: width,
                          height: height / 6,
                        ),
                      ),
                      Positioned(
                        right: width / 8,
                        left: width / 8,
                        top: height / 2.3,
                        child: OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.black,
                          focusedBorderColor: Colors.black,
                          showFieldAsBox: true,
                          cursorColor: Colors.white,
                          filled: true,

                          fillColor: Colors.white,
                          borderWidth: 4.0,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            // otpController.submit(int.parse(code));
                          },

                          onSubmit: (String verificationCode) {
                            otpController.submit(int.parse(verificationCode));
                          },
                        ),
                      ),
                      Positioned(
                        right: width / 10,
                        top: height / 1.9,
                        child: Row(
                          children: [
                            Container(
                              width: width / 20,
                              height: height / 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                // color: DynamicColor().white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                    '${otpController.start.value.toString()}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width / 35,
                                        color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              width: width / 40,
                            ),
                            Text('Seconds left',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 30,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height / 1.5,
                        right: width / 12,
                        left: width / 12,
                        child: otpController.start.value == 0
                            ? GestureDetector(
                                onTap: () {
                                  // Get.offNamed('/facerule');
                                },
                                child: Container(
                                  width: width / 1.2,
                                  height: height / 15,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: DynamicColor().white),
                                      // color: DynamicColor().primarycolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    'Resend'.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: DynamicColor().white),
                                  )),
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  ));
            }),
      ),
    );
  }
}
