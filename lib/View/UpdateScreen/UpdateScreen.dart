import 'dart:io';

import 'package:attendencesystem/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../API/BaseURl.dart';
import '../../Component/DynamicColor.dart';

import '../../Controller/SignInEmployeeController.dart';
import '../FeedbackScreen/FeedbackScreen.dart';

class UpdateScreen extends StatelessWidget {
  // SignInEmployeeController _signInEmployeeController =
  //     Get.put(SignInEmployeeController());
  var argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 5.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),

          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              // Spacer(),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 16,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1.0, primary: DynamicColor().primarycolor),
                    onPressed: () async {
                      BaseUrl.storage.erase();
                      // BaseUrl.url;
                      print(argumentData[3]);
                      if (await canLaunch(argumentData[3])) {
                        await launch(
                          argumentData[3],
                          forceSafariVC: false,
                          forceWebView: false,
                          headers: <String, String>{
                            'my_header_key': 'my_header_value'
                          },
                        );
                      } else {
                        throw 'Could not launch ${argumentData[3]}';
                      }
                    },
                    child: const Text('UPDATE')),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / ,
              // ),
              GestureDetector(
                onTap: () {
                  Get.to(
                      FeedbackScreen(
                        check: false,
                        form: false,
                      ),
                      transition: Transition.rightToLeft,
                      curve: Curves.easeInQuart);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent_sharp,
                      size: MediaQuery.of(context).size.width / 16,
                      color: DynamicColor().primarycolor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 30,
                    ),
                    Text(
                      'Any Feedback?',
                      style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width / 24,
                          fontWeight: FontWeight.w500,
                          color: DynamicColor().black),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 40,
              // ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height / 1.23,
                        padding: EdgeInsets.only(
                          top: 0.0,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F5FF),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 6,
                              // width: double.infinity,
                              padding: EdgeInsets.only(left: 25.0, top: 22),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/updatebg.png'),
                                      fit: BoxFit.cover)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What\'s New',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      'Find out what\'s include in this update',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              26),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 12.0),
                              child: Text(
                                'This update includes improvements to function as listed below. The exact changes may differ depending on your device model and variants.',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 26),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 0.0),
                              child: Text(
                                '\n${argumentData[0]}\n',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 28),
                              ),
                            ),
                            // Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 26.0, right: 25.0, top: 6.0),
                              child: Text(
                                'Current Release',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height / 60,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 26.0,
                                right: 25.0,
                              ),
                              child: Text(
                                '${argumentData[1]}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: DynamicColor().primarycolor,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 26.0, right: 25.0, top: 6.0),
                              child: Text(
                                'Available Release',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 250,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 26.0,
                                right: 25.0,
                              ),
                              child: Text(
                                '${argumentData[2]}',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: DynamicColor().primarycolor,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
