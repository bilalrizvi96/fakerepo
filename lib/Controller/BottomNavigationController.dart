import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/View/FeedbackScreen/FeedbackScreen.dart';
import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API/BaseURl.dart';
import '../View/CheckPointScreen/CheckPointScreen.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var connection = true.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // check() async {
  //   await DataConnectionChecker().onStatusChange.listen((status) async {
  //     if (status == DataConnectionStatus.connected) {
  //       connection.value = true;
  //       update();
  //     } else {
  //       connection.value = false;
  //       update();
  //     }
  //   });
  // }

  List<Widget> children = [
    HomeScreen(),
    SummaryScreen(),
    FeedbackScreen(
      check: true,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    popups();
  }

  popups() {
    if (BaseUrl.storage.read('ismessage') == true) {
      WidgetsBinding.instance!.addPostFrameCallback((duration) async {
        return Get.bottomSheet(
          Container(
            height: 700,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                image: DecorationImage(
                  image: NetworkImage(BaseUrl.storage.read("popupimage")),
                  fit: BoxFit.cover,
                )),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Welcome',
                  style: GoogleFonts.poppins(
                      color: DynamicColor().primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${BaseUrl.storage.read("welcomemessage")} ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      });
    }
    update();
  }

  void ItemIndex(index) {
    selectedIndex.value = index;

    update();
  }
}
