import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Controller/CheckPointController.dart';
import 'package:attendencesystem/Controller/TrackUserController.dart';
import 'package:attendencesystem/View/FeedbackScreen/FeedbackScreen.dart';
import 'package:attendencesystem/View/HomeScreen/HomeScreen.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:attendencesystem/View/SummaryScreen/SummaryScreen.dart';
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
  MaintenanceController _maintenanceController =
      Get.put(MaintenanceController());
  CheckPointController _checkPointController = Get.put(CheckPointController());
  SummaryController _summaryController = Get.put(SummaryController());
  TrackUserController _trackUserController = Get.put(TrackUserController());
  var userdatalist;
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
            form: false,
          )
        : BaseUrl.storage.read("checkpointaccess") == true
            ? CheckPointScreen()
            : MyProfileScreen()
  ];

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
    if (BaseUrl.storage.read('token') != "out" ||
        BaseUrl.storage.read('token') != null) {
      dashboardData();
      print('dashboard');
    }
    print('bilal');
    print(BaseUrl.storage.read("firstAttendanceRecordDate"));
    popups();
  }

  dashboardData() async {
    var response = await API().DashboardData();
    if (response.statusCode == 200) {
      userdatalist = response.data['data'][0];
      BaseUrl.storage
          .write("totalAbsent", userdatalist['absent_days'].toString());
      BaseUrl.storage
          .write("totalPresent", userdatalist['present_days'].toString());
      BaseUrl.storage.write("status", userdatalist['status']);
      BaseUrl.storage.write("isCheckOutOn", userdatalist['isClockOutOn']);
      BaseUrl.storage.write("isCheckInOn", userdatalist['isClockInOn']);
      print(userdatalist['isClockInOn']);
      print('test1');
      BaseUrl.storage.write("clockin", userdatalist['clockIn']);
      BaseUrl.storage
          .write("welcomemessage", userdatalist['message']['message']);
      BaseUrl.storage.write("welcometitle", userdatalist['message']['title']);
      BaseUrl.storage.write("clockout", userdatalist['clockOut']);
      BaseUrl.storage.write("ismessage", userdatalist['isMessageAvailable']);
      BaseUrl.storage.write("popupimage", userdatalist['message']['imageUrl']);
      BaseUrl.storage.write(
          "maintenance", userdatalist['maintenanceObject']['underMaintenance']);
      BaseUrl.storage.write("checkOutMissing", userdatalist['clockOutMissing']);
      if (userdatalist['version']['updateAvailability'] == true) {
        BaseUrl.storage.write("token", 'out');
        Get.offAllNamed(Routes.updatescreen, arguments: [
          userdatalist['version']['message'],
          userdatalist['version']['currentRelease'],
          userdatalist['version']['availableRelease'],
          userdatalist['version']['link'],
        ]);
        print(BaseUrl.storage.read("dateForMissingCheckout"));
      } else if (userdatalist['maintenanceObject']['underMaintenance'] ==
          true) {
        _maintenanceController.checkMaintenance();
      }
    } else {
      Get.snackbar("Dashboard ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    update();
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
    if (selectedIndex.value == 1) {
      this.dashboardData();
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
