import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Drawers {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Widget drawers(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return SafeArea(
      child: Container(
        width: width / 1.8,
        height: height,
        child: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage("assets/dashboardbg.png"),
                          fit: BoxFit.cover),
                    ),
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // width: MediaQuery.of(context).size.width / 5,
                          // height: MediaQuery.of(context).size.height / 5,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFFFFFFFF),
                                Color(0xFFFFFFFF),
                                Color(0xFFFFFFFF),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage("assets/person.png"),
                                fit: BoxFit.contain),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                BaseUrl.storage.read("name") != null
                                    ? BaseUrl.storage.read("name")
                                    : "Name",
                                style: GoogleFonts.poppins(
                                    fontSize: width / 20,
                                    fontWeight: FontWeight.w500,
                                    color: DynamicColor().white),
                              ),
                              Text(
                                BaseUrl.storage.read("designation") != " "
                                    ? BaseUrl.storage.read("designation")
                                    : "Designation",
                                style: GoogleFonts.poppins(
                                    fontSize: width / 30,
                                    fontWeight: FontWeight.w400,
                                    color: DynamicColor().white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Get.back();
                        Get.offNamed('/home');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Image.asset(
                            'assets/dashboard.png',
                            height: height / 45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Text(
                            "Dashboard",
                            style: GoogleFonts.poppins(
                                fontSize: width / 28,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.40)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      // hoverColor: Colors.black,
                      // focusColor: Colors.black,
                      // highlightColor: Colors.black,
                      disabledColor: Colors.black.withOpacity(0.40),
                      onPressed: () {
                        {
                          Get.back();
                          Get.offNamed('/profiletab');
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Image.asset(
                            'assets/myprofile.png',
                            height: height / 45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Text("My Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: width / 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.40))),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: height / 50),
                  // FlatButton(
                  //   padding: EdgeInsets.zero,
                  //   hoverColor: Colors.black,
                  //   focusColor: Colors.black,
                  //   highlightColor: Colors.black,
                  //   disabledColor: Colors.black.withOpacity(0.40),
                  //   onPressed: () {
                  //     {
                  //       Get.offNamed('/managesites');
                  //     }
                  //   },
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 50,
                  //       ),
                  //       Image.asset(
                  //         'assets/sites.png',
                  //         height: height / 45,
                  //       ),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 20,
                  //       ),
                  //       Text("Manage Sites",
                  //           style: GoogleFonts.poppins(
                  //               fontSize: width / 28,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.black.withOpacity(0.40))),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: height / 50),
                  // SizedBox(height: height / 50),
                  // FlatButton(
                  //   padding: EdgeInsets.zero,
                  //   hoverColor: Colors.black,
                  //   focusColor: Colors.black,
                  //   highlightColor: Colors.black,
                  //   disabledColor: Colors.black.withOpacity(0.40),
                  //   onPressed: () {
                  //     {
                  //       Get.offNamed('/reports');
                  //     }
                  //   },
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 50,
                  //       ),
                  //       Image.asset(
                  //         'assets/sites.png',
                  //         height: height / 45,
                  //       ),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 20,
                  //       ),
                  //       Text("Reports",
                  //           style: GoogleFonts.poppins(
                  //               fontSize: width / 28,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.black.withOpacity(0.40))),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: height / 50),
                  // FlatButton(
                  //   padding: EdgeInsets.zero,
                  //   hoverColor: Colors.black,
                  //   focusColor: Colors.black,
                  //   highlightColor: Colors.black,
                  //   disabledColor: Colors.black.withOpacity(0.40),
                  //   onPressed: () {
                  //     {
                  //       Get.offNamed('/setting');
                  //     }
                  //   },
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 50,
                  //       ),
                  //       Image.asset(
                  //         'assets/settings.png',
                  //         height: height / 45,
                  //       ),
                  //       SizedBox(
                  //         width: MediaQuery.of(context).size.width / 20,
                  //       ),
                  //       Text("Setting",
                  //           style: GoogleFonts.poppins(
                  //               fontSize: width / 28,
                  //               fontWeight: FontWeight.w400,
                  //               color: Colors.black.withOpacity(0.40))),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: height / 50),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      disabledColor: Colors.black.withOpacity(0.40),
                      onPressed: () {
                        Get.back();
                        Get.offNamed('/summary');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Image.asset(
                            'assets/report.png',
                            height: height / 45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 15,
                          ),
                          Text("Summary",
                              style: GoogleFonts.poppins(
                                  fontSize: width / 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.40))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      disabledColor: Colors.black.withOpacity(0.40),
                      onPressed: () {
                        Get.back();
                        BaseUrl.storage.erase();
                        Get.offNamed('/signinemp');
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 50,
                          ),
                          Image.asset(
                            'assets/signout.png',
                            height: height / 45,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 25,
                          ),
                          Text("Log out",
                              style: GoogleFonts.poppins(
                                  fontSize: width / 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.40))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
