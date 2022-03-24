import 'dart:io';
import 'package:attendencesystem/Controller/FeedbackController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../API/BaseURl.dart';
import '../../Component/DynamicColor.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({this.check});
  var check;
  FeedbackController _feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    check == false
        ? _feedbackController.check = false
        : _feedbackController.check = true;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
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
                                      Text(
                                        'Feedback',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: width / 16),
                                      ),
                                      Spacer(),
                                      check == false
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                Get.toNamed('/checkpoint');
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0, left: 8.0),
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  size: width / 16,
                                                  color: DynamicColor()
                                                      .primarycolor,
                                                ),
                                              ),
                                            ),
                                      SizedBox(
                                        width: width / 50,
                                      ),
                                      check == false
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                BaseUrl.storage
                                                    .write("token", "out");
                                                Get.offAllNamed('/signinemp');
                                              },
                                              child: Icon(
                                                Icons.logout,
                                                size: width / 16,
                                                color: Colors.red,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Container(
                                  width: width / 1.2,
                                  child: check == false
                                      ? TextFormField(
                                          controller: _feedbackController
                                              .namecontroller,
                                          validator:
                                              _feedbackController.validators,
                                          readOnly:
                                              check == false ? false : true,
                                          decoration: new InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: DynamicColor()
                                                        .titletextcolor,
                                                    width: 1.2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: DynamicColor()
                                                        .titletextcolor,
                                                    width: 1.0),
                                              ),
                                              hintText: _feedbackController
                                                          .namecontroller
                                                          .text ==
                                                      ''
                                                  ? "Name"
                                                  : '',
                                              hintStyle: GoogleFonts.poppins(
                                                  color: DynamicColor().black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width / 25)),
                                        )
                                      : Text(
                                          _feedbackController
                                              .namecontroller.text
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Container(
                                  width: width / 1.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: DynamicColor().titletextcolor),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding:
                                      EdgeInsets.only(right: 10.0, left: 10),
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
                                      'Choose Category',
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
                                        height: 130,
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
