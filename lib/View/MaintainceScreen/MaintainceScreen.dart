import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/NoInternet.dart';
import 'package:attendencesystem/Controller/MaintenanceController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../Component/ErrorLoading.dart';
import '../../Routes/Routes.dart';
// import 'package:slide_countdown/slide_countdown.dart';

class MaintainceScreen extends StatelessWidget {
  MaintainceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaintenanceController maintenanceController =
        Get.put(MaintenanceController());
    maintenanceController.check();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          child: GetBuilder(
              init: maintenanceController,
              builder: (_) {
                return maintenanceController.connection.value == true
                    ? maintenanceController.Loading.value == false
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/maintaince.png',
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: height / 40,
                                ),
                                Text(
                                  'Maintenance'.toUpperCase(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width / 16),
                                ),
                                SizedBox(
                                  height: height / 40,
                                ),
                                Container(
                                  height: height / 7,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 40.0, left: 40.0),
                                    child: Text(
                                      '${BaseUrl.storage.read('message')}',
                                      // 'We are currently undergoing maintenance this won\'t take long',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          color: DynamicColor().primarycolor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: width / 26),
                                    ),
                                  ),
                                ),
                                SlideCountdownSeparated(
                                  height: height / 15,
                                  width: width / 7.5,
                                  decoration: BoxDecoration(
                                      color: DynamicColor().primarycolor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  curve: Curves.ease,
                                  onDone: () {
                                    Get.offAllNamed(Routes.signinemp);
                                  },
                                  duration: Duration(
                                      minutes:
                                          BaseUrl.storage.read('time') != null
                                              ? BaseUrl.storage.read('time')
                                              : 1),
                                )
                              ],
                            ),
                          )
                        : ErrorLoading(height: 200.0, width: 200.0)
                    : NoInternet(height: height, width: width);
              })),
    );
  }
}
