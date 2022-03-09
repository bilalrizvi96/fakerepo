import 'dart:io';

import 'package:attendencesystem/Controller/FeedbackController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../API/BaseURl.dart';
import '../../Component/DynamicColor.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackController _feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/attendancebg.png'),
          //         fit: BoxFit.cover)),
          child: Form(
            key: _feedbackController.feedbackFormKey,
            child: GetBuilder(
                init: _feedbackController,
                builder: (_) {
                  return Stack(
                    children: [
                      Image.network(
                        'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/attendancebg.png',
                        fit: BoxFit.cover,
                        width: width,
                        height: height,
                      ),
                      _feedbackController.Loading == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 22.0, left: 22.0, top: 22.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: width / 50,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 50,
                                      ),
                                      Text(
                                        'FeedBack',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width / 16),
                                      ),
                                      Spacer(),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     BaseUrl.storage.write("token", "out");
                                      //     Get.offAllNamed('/signinemp');
                                      //   },
                                      //   child: Icon(
                                      //     Icons.logout,
                                      //     size: width / 16,
                                      //     color: Colors.red,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Container(
                                  width: width / 1.2,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: new InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  DynamicColor().titletextcolor,
                                              width: 1.2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  DynamicColor().titletextcolor,
                                              width: 1.0),
                                        ),
                                        hintText: BaseUrl.storage
                                            .read('name')
                                            .toString()
                                            .toUpperCase(),
                                        hintStyle: GoogleFonts.poppins(
                                            color: DynamicColor().black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: width / 25)),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 15,
                                ),
                                Container(
                                  // width: 1.2,
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.only(right: 30.0, left: 30),
                                  child: DropdownButton<String>(
                                    value:
                                        _feedbackController.dropdownValue.value,
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: DynamicColor().primarycolor,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    underline: Container(
                                      height: 2,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(500.0)),
                                    ),
                                    focusColor: Colors.black,
                                    dropdownColor: Colors.white,
                                    onChanged: (newValue) {
                                      _feedbackController.valueupdate(newValue);
                                      // FocusScope.of(context).nextFocus();
                                    },
                                    items: <String>[
                                      'Select',
                                      'Feedback',
                                      'Technical Support',
                                      'HR',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Container(
                                  width: width / 1.2,
                                  child: TextFormField(
                                    controller:
                                        _feedbackController.feedbackcontroller,
                                    validator: _feedbackController.validators,
                                    maxLines: 6,
                                    maxLength: 1000,
                                    decoration: new InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                DynamicColor().titletextcolor,
                                            width: 1.2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                DynamicColor().titletextcolor,
                                            width: 1.0),
                                      ),
                                      hintText: 'Write your feedback here',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 100,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _feedbackController.imgFromCameras();
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: width / 15,
                                      ),
                                      Icon(Icons.camera,
                                          color: DynamicColor().primarycolor),
                                      SizedBox(
                                        width: width / 40,
                                      ),
                                      Text(
                                        'Upload Screenshot',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            color: DynamicColor().black),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                _feedbackController.faceImage != null
                                    ? Container(
                                        width: 100,
                                        height: 150,
                                        child: Image.file(File(
                                            _feedbackController
                                                .faceImage!.path)),
                                      )
                                    : Container(),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    _feedbackController.submit();
                                  },
                                  child: Container(
                                    width: width / 1.2,
                                    height: height / 15,
                                    decoration: BoxDecoration(
                                        color: DynamicColor().primarycolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      'Submit'.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: DynamicColor().white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 30,
                                ),
                              ],
                            )
                          : Center(
                              child: Image.asset(
                                "assets/1.gif",
                                height: 300,
                                width: 300,
                              ),
                            ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
