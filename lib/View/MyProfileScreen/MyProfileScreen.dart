import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/NoInternet.dart';

import 'package:attendencesystem/Controller/SignInEmployeeController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/ErrorLoading.dart';
import '../../Controller/ProfileController.dart';
import '../../Routes/Routes.dart';

class MyProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    profileController.check();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      backgroundColor: Color(0xFFEBEFFF),
      body: SingleChildScrollView(
        child: Container(
            width: width,
            // color: Color(0xFFEBEFFF),
            padding: EdgeInsets.only(top: 15.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: [
                  GetBuilder(
                      init: profileController,
                      builder: (context) {
                        return profileController.Loading.value == false
                            ? profileController.connection.value == true
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 20, bottom: 8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width / 50,
                                            ),

                                            // GestureDetector(
                                            //     onTap: () {
                                            //       Get.back();
                                            //     },
                                            //     child: Icon(Icons.arrow_back_ios,
                                            //         color: Colors.grey[600])),
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
                                                BaseUrl.storage
                                                    .write("token", "out");
                                                Get.offAllNamed(
                                                    Routes.signinemp);
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
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/register/' +
                                                        BaseUrl.storage
                                                            .read('empCode') +
                                                        ".jpg",
                                                fit: BoxFit.fill,
                                                width: width / 4.5,
                                                height: height / 7,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              )

                                              // Image.network(
                                              //   'https://attandence-bucket.s3.us-east-2.amazonaws.com/register/' +
                                              //       BaseUrl.storage.read('empCode') +
                                              //       ".jpg",
                                              //   fit: BoxFit.fill,
                                              //   width: width / 4.5,
                                              //   height: height / 7,
                                              // ),
                                              ),
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
                                              readOnly: true,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                hintText: BaseUrl.storage
                                                            .read("empCode") !=
                                                        ' '
                                                    ? BaseUrl.storage
                                                        .read("empCode")
                                                    : "First Name",
                                                focusColor:
                                                    DynamicColor().primarycolor,
                                                hoverColor:
                                                    DynamicColor().primarycolor,
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
                                              readOnly: true,

                                              //   validator: myProfileController.validators,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                hintText: BaseUrl.storage
                                                            .read("name") !=
                                                        ' '
                                                    ? BaseUrl.storage
                                                        .read("name")
                                                    : "First Name",
                                                focusColor:
                                                    DynamicColor().primarycolor,
                                                hoverColor:
                                                    DynamicColor().primarycolor,
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: InputBorder.none,
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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.number,

                                              //   validator: myProfileController.validators,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage
                                                              .read(
                                                                  "phoneNo") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("phoneNo")
                                                      : "Mobile Number",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,

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
                                        padding:
                                            const EdgeInsets.only(left: 35.0),
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
                                              readOnly: true,

                                              //   validator: myProfileController.validators,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage.read(
                                                              "designation") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("designation")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.datetime,

                                              //   validator: myProfileController.validators,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage.read(
                                                              "starttime") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("starttime")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,

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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.datetime,

                                              //   validator: myProfileController.validators,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage.read(
                                                              "endTiming") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("endTiming")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage.read(
                                                              "hoursPerWeek") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("hoursPerWeek")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //     left: 35.0,
                                      //   ),
                                      //   child: Align(
                                      //       alignment: Alignment.topLeft,
                                      //       child: Text(
                                      //         'Off Days',
                                      //         style: GoogleFonts.poppins(
                                      //             fontWeight: FontWeight.w500,
                                      //             fontSize: width / 30,
                                      //             color: DynamicColor().black),
                                      //       )),
                                      // ),
                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      //   crossAxisAlignment: CrossAxisAlignment.center,
                                      //   children: [
                                      //     Container(
                                      //       width: width / 80,
                                      //       height: height / 18,
                                      //       color: DynamicColor().primarycolor,
                                      //     ),
                                      //     Container(
                                      //       width: width / 1.22,
                                      //       child: TextFormField(
                                      //         readOnly: true,
                                      //         keyboardType: TextInputType.datetime,
                                      //
                                      //         cursorColor: DynamicColor().primarycolor,
                                      //         style: GoogleFonts.poppins(
                                      //             fontSize: width / 26,
                                      //             color: DynamicColor().primarycolor,
                                      //             fontWeight: FontWeight.w600),
                                      //         decoration: new InputDecoration(
                                      //             hintText:
                                      //                 BaseUrl.storage.read("offDay") !=
                                      //                         null
                                      //                     ? BaseUrl.storage
                                      //                         .read("offDay")
                                      //                         .toString()
                                      //                         .replaceAll('[', '')
                                      //                         .replaceAll(']', '')
                                      //                     : "First Name",
                                      //             focusColor: DynamicColor().primarycolor,
                                      //             hoverColor: DynamicColor().primarycolor,
                                      //             fillColor: Colors.white,
                                      //             filled: true,
                                      //             border: InputBorder.none),
                                      //         // keyboardType: TextInputType.none,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // SizedBox(
                                      //   height: height / 80,
                                      // ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35.0),
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
                                              readOnly: true,

                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage
                                                              .read(
                                                                  "address") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("address")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                        padding:
                                            const EdgeInsets.only(left: 35.0),
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
                                              readOnly: true,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage
                                                              .read("eMail") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("eMail")
                                                      : "First Name",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                        padding:
                                            const EdgeInsets.only(left: 35.0),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Shift Code',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 30,
                                                  color: DynamicColor().black),
                                            )),
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
                                              readOnly: true,
                                              keyboardType: TextInputType.text,
                                              cursorColor:
                                                  DynamicColor().primarycolor,
                                              style: GoogleFonts.poppins(
                                                  fontSize: width / 26,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                  fontWeight: FontWeight.w600),
                                              decoration: new InputDecoration(
                                                  hintText: BaseUrl.storage.read(
                                                              "shiftTiming") !=
                                                          ' '
                                                      ? BaseUrl.storage
                                                          .read("shiftTiming")
                                                      : "Shift Timing",
                                                  focusColor: DynamicColor()
                                                      .primarycolor,
                                                  hoverColor: DynamicColor()
                                                      .primarycolor,
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
                                  )
                                : NoInternet(height: height, width: width)
                            : ErrorLoading(height: 300.0, width: 300.0);
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
