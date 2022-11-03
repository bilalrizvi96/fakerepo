import 'dart:io';

import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/CheckPointController.dart';
import 'package:attendencesystem/Controller/TrackUserController.dart';
import 'package:attendencesystem/View/FeedbackScreen/FeedbackScreen.dart';
import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';
import '../Routes/Routes.dart';
import '../View/CheckPointScreen/CheckPointScreen.dart';
import '../View/TrackUserScreen/TrackUserScreen.dart';
import 'HomeController.dart';
import 'MaintenanceController.dart';
import 'SummaryController.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var connection = true.obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  CheckPointController _checkPointController = Get.put(CheckPointController());
  SummaryController _summaryController = Get.put(SummaryController());
  TrackUserController _trackUserController = Get.put(TrackUserController());
  HomeController _homeController = Get.put(HomeController());

  var widgetChildren = <Widget>[
    HomeScreen(),
    SummaryScreen(),
    BaseUrl.storage.read("trackuseraccess") == true
        ? TrackUserScreen()
        : BaseUrl.storage.read("checkpointaccess") == true
            ? CheckPointScreen()
            : FeedbackScreen(
                check: true,
                form: false,
              ),
    BaseUrl.storage.read("checkpointaccess") == true &&
            BaseUrl.storage.read("trackuseraccess") == false
        ? FeedbackScreen(
            check: true,
            form: true,
          )
        : BaseUrl.storage.read("checkpointaccess") == true
            ? CheckPointScreen()
            : MyProfileScreen(
                check: true,
              )
  ];
  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;
        update();
      }
    } on SocketException catch (_) {
      connection.value = false;
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        update();
      } else {
        connection.value = false;
        update();
      }
      update();
    });
  }
  // check() async {
  //   await DataConnectionChecker().onStatusChange.listen((status) async {
  //     if (status == DataConnectionStatus.connected) {
  //       connection = true;
  //       update();
  //     } else {
  //       connection = false;
  //       update();
  //     }
  //   });
  // }

  // List<Widget> children = [
  //   HomeScreen(),
  //   SummaryScreen(),
  //   FeedbackScreen(
  //     check: true,
  //     form: false,
  //   ),
  // ];
  @override
  void onInit() {
    super.onInit();
    // if (BaseUrl.storage.read('token') != "out" ||
    //     BaseUrl.storage.read('token') != null) {
    //   // dashboardData();
    //   print('dashboard');
    // }
    check();
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
    if (selectedIndex.value == 0) {
      _homeController.onInit();
      update();
      // this.dashboardData();

    } else if (selectedIndex.value == 1) {
      this._summaryController.onInit();
      _summaryController.init();
      update();
    } else if (selectedIndex.value == 2) {
      if (BaseUrl.storage.read("trackuseraccess") != false) {
        this._trackUserController.onInit();
        _trackUserController.init();
        update();
      }
    } else if (selectedIndex.value == 3) {
      if (BaseUrl.storage.read("checkpointaccess") != false) {
        this._checkPointController.onInit();
        update();
      }
    }
    update();
  }
}
