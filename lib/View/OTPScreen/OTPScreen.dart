import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/OTPController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatelessWidget {
  OTPController otpController = Get.put(OTPController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
          init: otpController,
          builder: (_) {
            return Container(
                height: height,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
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
                          child: Image.network(
                            'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/otpbg.png',
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width / 20,
                        top: height / 6,
                        child: Image.network(
                          'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/OTPphone.png',
                          fit: BoxFit.cover,
                          // width: width,
                          height: height / 6,
                        ),
                      ),
                      Positioned(
                        right: width / 8,
                        left: width / 8,
                        top: height / 2.3,
                        child: Text(
                          'Please wait while we validate the passcode sent to your registered number ${BaseUrl.storage.read('phone')}. If the code is not validated automatically, you can enter it below.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: width / 30),
                        ),
                      ),
                      Positioned(
                        right: width / 8,
                        left: width / 8,
                        top: height / 1.7,
                        child: PinCodeTextField(
                          keyboardType: TextInputType.phone,
                          controller: otpController.otptextcontroller,
                          hasTextBorderColor: Colors.white,
                          highlightPinBoxColor: DynamicColor().white,
                          defaultBorderColor: Colors.white,
                          // autofocus: true,
                          isCupertino: true,

                          pinTextStyle:
                              TextStyle(color: DynamicColor().primarycolor),
                          highlightAnimationBeginColor: Colors.black,
                          highlightAnimationEndColor: Colors.white12,
                          pinBoxDecoration:
                              ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                          onDone: (String val) {
                            otpController.submit();
                          },

                          maxLength: 6,
                          pinBoxHeight: 45,
                          pinBoxWidth: width / 10,
                        ),
                      ),
                      Positioned(
                        right: width / 3,
                        left: width / 2.8,
                        top: height / 1.5,
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
                        top: height / 1.3,
                        right: width / 12,
                        left: width / 12,
                        child: otpController.start.value == 0
                            ? GestureDetector(
                                onTap: () {
                                  otpController.resendOtp();
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
                  ),
                ));
          }),
    );
  }
}
