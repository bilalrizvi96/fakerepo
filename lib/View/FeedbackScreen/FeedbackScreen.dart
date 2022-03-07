import 'package:attendencesystem/Controller/FeedbackController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../API/BaseURl.dart';
import '../../Component/DynamicColor.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackController _feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/attendancebg.png'),
                  fit: BoxFit.cover)),
          child: Form(
            key: _feedbackController.feedbackFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 22.0, left: 22.0, top: 22.0),
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
                            fontWeight: FontWeight.w500, fontSize: width / 16),
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
                            color: DynamicColor().titletextcolor, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: DynamicColor().titletextcolor, width: 1.0),
                      ),
                      label: Text(
                          BaseUrl.storage.read('name').toString().toUpperCase(),
                          style: GoogleFonts.poppins(
                              color: DynamicColor().black,
                              fontWeight: FontWeight.w600,
                              fontSize: width / 25)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Container(
                  width: width / 1.2,
                  child: TextFormField(
                    controller: _feedbackController.feedbackcontroller,
                    validator: _feedbackController.validators,
                    maxLines: 10,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: DynamicColor().titletextcolor, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: DynamicColor().titletextcolor, width: 1.0),
                      ),
                      hintText: 'Write your feedback here',
                    ),
                  ),
                ),
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
                        borderRadius: BorderRadius.circular(10)),
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
            ),
          ),
        ),
      ),
    );
  }
}
