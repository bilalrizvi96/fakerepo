import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Controller/SigninController.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatelessWidget {
  SigninController signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          // padding: EdgeInsets.only(right: 5, left: 10),
          // color: DynamicColor().white,
          child: GetBuilder(
            init: signinController,
            builder: (_) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 800),
                      slidingCurve: Curves.decelerate,
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
                            width: width / 25,
                          ),
                          Container(
                            width: width / 3,
                            child: Text(
                              'Reports',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 20,
                                  color: DynamicColor().black),
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/reportsf.png',
                            fit: BoxFit.cover,
                            height: height / 8,
                          ),
                          SizedBox(
                            width: width / 8,
                          ),
                          Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                size: width / 13,
                                color: DynamicColor().primarycolor,
                              ),
                            );
                          }),
                          SizedBox(
                            width: width / 50,
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Container(
                      height: height / 500,
                      width: width / 1.65,
                      decoration: BoxDecoration(
                          color: Color(0xFFD1D1D1),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0, left: 330),
                    child: Container(
                      height: height / 500,
                      width: width / 8,
                      decoration: BoxDecoration(
                          color: Color(0xFFD1D1D1),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0, left: 390),
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
                        color: Color(0xFFEBEFFF),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Please select Report Type',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 30,
                                  color: DynamicColor().black),
                            )),
                      ),
                      SizedBox(
                        height: height / 70,
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
                                  hintText: 'ComboBox',
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
                      // SizedBox(
                      //   height: height / 10,
                      // ),
                      Spacer(),
                      Container(
                        height: height / 3.2,
                        width: width,
                        decoration: BoxDecoration(
                          color: DynamicColor().primarycolor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/download.png",
                              width: width / 6,
                            ),
                            SizedBox(
                              height: height / 50,
                            ),
                            Text(
                              'Download',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 20,
                                  color: DynamicColor().white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
