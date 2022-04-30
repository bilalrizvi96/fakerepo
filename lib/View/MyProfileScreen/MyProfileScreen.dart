import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/MyProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileController myProfileController = Get.put(MyProfileController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: width,
              color: Color(0xFFEBEFFF),
              padding: EdgeInsets.only(top: 15.0),
              child: GetBuilder(
                  init: myProfileController,
                  builder: (_) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 20, bottom: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: width / 50,
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(Icons.arrow_back_ios,
                                          color: Colors.grey[600])),
                                  SizedBox(
                                    width: width / 50,
                                  ),
                                  Text(
                                    'My Profile',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 16),
                                  ),
                                  Spacer(),

                                  GestureDetector(
                                    onTap: () {
                                      BaseUrl.storage.write("token", "out");
                                      Get.offAllNamed('/signinemp');
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: width / 16,
                                      color: Colors.red,
                                    ),
                                  ),

                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  // Spacer(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
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
                                    readOnly: true,
                                    controller:
                                        myProfileController.firstnameController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                      hintText:
                                          BaseUrl.storage.read("firstName") !=
                                                  ' '
                                              ? BaseUrl.storage.read("empCode")
                                              : "First Name",
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none,
                                      //fillColor: Colors.green
                                    ),
                                    // keyboardType: TextInputType.none,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Name',
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
                                    readOnly: true,
                                    controller:
                                        myProfileController.firstnameController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                      hintText:
                                          BaseUrl.storage.read("name") != ' '
                                              ? BaseUrl.storage.read("name")
                                              : "Name",
                                      focusColor: DynamicColor().primarycolor,
                                      hoverColor: DynamicColor().primarycolor,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: InputBorder.none,
                                      //fillColor: Colors.green
                                    ),
                                    // keyboardType: TextInputType.none,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 80,
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
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    controller:
                                        myProfileController.mobileController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("phoneNo") !=
                                                ' '
                                            ? BaseUrl.storage.read("phoneNo")
                                            : "Mobile Number",
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
                              height: height / 80,
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
                                    readOnly: true,
                                    controller: myProfileController
                                        .designationController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("designation") !=
                                                ' '
                                            ? BaseUrl.storage
                                                .read("designation")
                                            : "First Name",
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
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Start Timing',
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
                                    readOnly: true,
                                    keyboardType: TextInputType.datetime,
                                    controller: myProfileController
                                        .date_of_joiningController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("starttime") !=
                                                ' '
                                            ? BaseUrl.storage.read("starttime")
                                            : "First Name",
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
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'End Timing',
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
                                    readOnly: true,
                                    keyboardType: TextInputType.datetime,
                                    controller: myProfileController
                                        .date_of_joiningController,
                                    //   validator: myProfileController.validators,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("endTiming") !=
                                                ' '
                                            ? BaseUrl.storage.read("endTiming")
                                            : "First Name",
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
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Hours Per Week',
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
                                    readOnly: true,
                                    keyboardType: TextInputType.datetime,
                                    controller: myProfileController
                                        .date_of_joiningController,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("hoursPerWeek") !=
                                                ' '
                                            ? BaseUrl.storage
                                                .read("hoursPerWeek")
                                            : "First Name",
                                        focusColor: DynamicColor().primarycolor,
                                        hoverColor: DynamicColor().primarycolor,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35.0,
                              ),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Off Days',
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
                                    readOnly: true,
                                    keyboardType: TextInputType.datetime,
                                    controller: myProfileController
                                        .date_of_joiningController,

                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText:
                                            BaseUrl.storage.read("offDay") !=
                                                    null
                                                ? BaseUrl.storage
                                                    .read("offDay")
                                                    .toString()
                                                    .replaceAll('[', '')
                                                    .replaceAll(']', '')
                                                : "First Name",
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
                              height: height / 80,
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
                                    readOnly: true,
                                    controller:
                                        myProfileController.addressController,

                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("address") !=
                                                ' '
                                            ? BaseUrl.storage.read("address")
                                            : "First Name",
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
                              height: height / 80,
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
                                    readOnly: true,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: myProfileController
                                        .email_addressController,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText:
                                            BaseUrl.storage.read("eMail") != ' '
                                                ? BaseUrl.storage.read("eMail")
                                                : "First Name",
                                        focusColor: DynamicColor().primarycolor,
                                        hoverColor: DynamicColor().primarycolor,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 80,
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
                                    readOnly: true,
                                    keyboardType: TextInputType.text,
                                    controller: myProfileController
                                        .shift_timmingController,
                                    cursorColor: DynamicColor().primarycolor,
                                    style: GoogleFonts.poppins(
                                        color: DynamicColor().primarycolor,
                                        fontWeight: FontWeight.w600),
                                    decoration: new InputDecoration(
                                        hintText: BaseUrl.storage
                                                    .read("shiftTiming") !=
                                                ' '
                                            ? BaseUrl.storage
                                                .read("shiftTiming")
                                            : "Shift Timing",
                                        focusColor: DynamicColor().primarycolor,
                                        hoverColor: DynamicColor().primarycolor,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height / 10,
                            ),
                          ],
                        ),
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}
