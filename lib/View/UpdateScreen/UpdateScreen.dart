import 'dart:io';

import 'package:attendencesystem/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../API/BaseURl.dart';
import '../../Component/DynamicColor.dart';

import '../FeedbackScreen/FeedbackScreen.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.only(
                      top: 150.0,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFF2F5FF),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 12.0),
                          child: Text(
                            'This update includes improvements to function as listed below.\n\nThe exact changes may differ depending on your device model,region and service provider.'
                            '\n\n${BaseUrl.message}',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    MediaQuery.of(context).size.width / 26),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 25.0, top: 12.0),
                          child: Text(
                            'Current Release',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 250,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            right: 25.0,
                          ),
                          child: Text(
                            '${BaseUrl.currentRelease}',
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
                              left: 30.0, right: 25.0, top: 12.0),
                          child: Text(
                            'Available Release',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.width / 20),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 250,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            right: 25.0,
                          ),
                          child: Text(
                            '${BaseUrl.availableRelease}',
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    // width: double.infinity,
                    padding: EdgeInsets.only(left: 25.0, top: 25),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/updatebg.png'),
                            fit: BoxFit.fitWidth)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What\'s New',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width / 20),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            'Find out what\'s include in this update',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    MediaQuery.of(context).size.width / 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.width / 8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1.0, primary: DynamicColor().primarycolor),
                    onPressed: () async {
                      BaseUrl.storage.erase();
                      BaseUrl.url;
                      print(BaseUrl.url);
                      if (await canLaunch(BaseUrl.url)) {
                        await launch(
                          BaseUrl.url,
                          forceSafariVC: false,
                          forceWebView: false,
                          headers: <String, String>{
                            'my_header_key': 'my_header_value'
                          },
                        );
                      } else {
                        throw 'Could not launch ${BaseUrl.url}';
                      }
                    },
                    child: const Text('UPDATE')),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(FeedbackScreen(
                    check: false,
                  ));
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
                          fontSize: MediaQuery.of(context).size.width / 22,
                          fontWeight: FontWeight.w600,
                          color: DynamicColor().black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
