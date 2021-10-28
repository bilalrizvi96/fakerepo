import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Controller/SigninController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  SigninController signinController = Get.put(SigninController());
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(selectedTime);
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: GetBuilder(
              init: signinController,
              builder: (_) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width / 20,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey[300],
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          // Spacer(),
                          Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: width / 18,
                                color: DynamicColor().black),
                          ),
                          SizedBox(width: width / 3.9),
                          Image.asset(
                            'assets/signinclock.png',
                            fit: BoxFit.cover,
                            height: height / 8,
                          ),
                          Spacer(),
                          Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                size: width / 15,
                                color: DynamicColor().primarycolor,
                              ),
                            );
                          }),
                          SizedBox(
                            width: width / 20,
                          ),
                        ],
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
                      padding: const EdgeInsets.only(top: 150),
                      child: Container(
                        height: height,
                        width: width,
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0)),
                            color: Color(0xFFEBEFFF).withOpacity(0.33)),
                        child: Text(
                          'Setup Standard Working Hours',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: width / 28,
                              color: DynamicColor().black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 220),
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
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 4,
                          ),
                          Container(
                            width: width / 1.2,
                            height: height / 1.6,
                            child: TimePickerDialog(
                              initialTime: selectedTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                              cancelText: "Not now",
                              confirmText: "Save",
                              helpText: "Set Time",
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
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
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
