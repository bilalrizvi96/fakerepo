import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:attendencesystem/Model/SitesModel.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_widget/home_widget.dart';

import '../API/BaseURl.dart';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../Routes/Routes.dart';
import '../View/HomeScreen/HomeScreen.dart';
import 'MaintenanceController.dart';

class HomeController extends GetxController {
  // MaintenanceController _maintenanceController =
  //     Get.put(MaintenanceController());
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  var name;
  var center = new LatLng(33.652100, 75.123398).obs;
  var currentlocation = new LatLng(33.652100, 75.123398).obs;
  ScanResult? scanResult;
  var sites = "".obs;
  var url = ''.obs;
  var connection = true.obs;
  var clockindate;
  var clockindate2;
  var Loading = false.obs;
  var dropdownValue = ''.obs;
  var reasonFormKey = GlobalKey<FormState>();
  var reasoncontroller = TextEditingController();
  List<String> sitelist = [];
  var sitedatalist = [].obs;
  var clockinofflinelist = [].obs;
  // var clockoutofflinelist = [].obs;
  var clockin_check = false.obs;
  // var clockout_check = false.obs;
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  var userdatalist;
  var data_check = false.obs;
  var selectedTime;
  var initalTime;
  var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  @override
  void onInit() {
    super.onInit();
    check();
    init();
    print(connection.value);
    print("connection");
    initalTime = BaseUrl.storage.read("endTiming");
  }

  init() async {
    Loading.value = false;
    update();
    current.value =
        months[selectedmonth.value - 1] + "-" + selectedyear.value.toString();
    var nam = BaseUrl.storage.read('name').toString().split(' ');
    name = nam[0].toString();
    data_check.value = false;
    sitedatalist.value.clear();

    print(BaseUrl.storage.read("sites_data"));
    var ssitelist = BaseUrl.storage.read("sites_name");
    sitelist.clear();
    for (var val in ssitelist) {
      sitelist.add(val.toString());
      sitelist.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
      dropdownValue.value = sitelist.first;
    }
    if (connection.value == true) {}

    if (BaseUrl.storage.read('token') != null ||
        BaseUrl.storage.read('token') != 'out') {
      // if (connection.value == true) {
      print('dashboardin');
      dashboardData();
      getSites();

      // } else {
      //   print('dashboardout');
      //   BaseUrl.storage.write("token", "out");
      //   Get.offNamed("/signinemp");
      // }
    }
    sitedatalist.value = json.decode(BaseUrl.storage.read("sites_data"));
    update();
    // if (BaseUrl.storage.read('token') != null ||
    //     BaseUrl.storage.read('token') != 'out') {
    //   HomeWidget.widgetClicked.listen((Uri? uri) => scan());
    // }
  }

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;
        print("connection");
        connection.value = true;
        Loading.value = true;
        update();
        // dashboardData();
        // getSites();
        if (clockin_check.value == false) {
          if (data_check.value == false) {
            offline_data_send();
            dashboardData();
            getSites();
          }
        }
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });

        print("connection");
      }
    } on SocketException catch (_) {
      connection.value = false;
      Loading.value = true;
      update();
      Future.delayed(new Duration(milliseconds: 2000), () {
        Loading.value = false;
        if (BaseUrl.storage.read("status") == null ||
            BaseUrl.storage.read("status") == 'null' ||
            sitedatalist.isEmpty) {
          print('dashboardin');
          BaseUrl.storage.write("token", "out");
          Get.offAndToNamed("/signinemp");
          update();
        }
        update();
      });
      print("connection");
    }

    await DataConnectionChecker().onStatusChange.listen((status) {
      // print(status);
      // print("connection");
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        update();
        //
        Loading.value = true;
        update();

        if (clockin_check.value == false) {
          if (data_check.value == false) {
            offline_data_send();
            dashboardData();
            getSites();
          }
        }
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });
      } else {
        Loading.value = true;
        update();
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          if (BaseUrl.storage.read("status") == null ||
              BaseUrl.storage.read("status") == 'null' ||
              sitedatalist.isEmpty) {
            print('dashboardin');
            BaseUrl.storage.write("token", "out");
            Get.offNamed("/signinemp");
          }
          update();
        });
        connection.value = false;
        update();
      }

      update();
    });

    print("connection");
    update();
  }

  clockoutCheck(width, height) {
    var date = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var clockindate2 = outputFormat.format(date);

    // if (BaseUrl.storage.read("status") == true) {
    // var check = BaseUrl.storage
    //     .read("lastAttendanceRecordDate")
    //     .toString()
    //     .split('T')[0]
    //     .split('-')[2];
    // print(BaseUrl.storage.read("lastAttendanceRecordDate"));

    var difference = DateTime.parse(clockindate2).difference(
        DateTime.parse(BaseUrl.storage.read("lastAttendanceRecordDate")));
    print(int.parse(difference.toString().split(':')[0]));

    print('difference');

    if (int.parse(difference.toString().split(':')[0]).abs() < 16) {
      scan();
      Loading.value = true;
    } else {
      // init();
      Get.bottomSheet(
          ReasonBottom(
            width: width,
            height: height,
          ),
          elevation: 20.0,
          enableDrag: false,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          )));
    }
    // }
  }

  Future<void> selectTime() async {
    // var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    DatePicker.showTime12hPicker(Get.context!,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true, onConfirm: (time) {
      print('confirm $time');
      selectedTime = time;
      initalTime =
          outputFormat.format(selectedTime).split('T')[1].split(':')[0] +
              ":" +
              outputFormat.format(selectedTime).split('T')[1].split(':')[1];
      print(BaseUrl.storage.read("lastAttendanceRecordDate"));
      print(BaseUrl.storage.read("endTiming"));
      update();
    }, currentTime: DateTime.now(), locale: LocaleType.en);

    update();
  }

  void offline_data_send() async {
    data_check.value = true;
    update();
    // print(BaseUrl.storage.read("offlineClockIn").length);
    if (BaseUrl.storage.read('token') != null &&
        BaseUrl.storage.read('token') != 'out') {
      //print(BaseUrl.storage.read("offlineClockIn"));

      if (clockin_check.value == false) {
        print('offline_data_send');
        Loading.value = false;
        clockin_check.value = true;
        var list = await BaseUrl.storage.read("offlineClockIn");
        if (list != '') {
          var response = await API().OfflineCheckIn(list: list);
          if (response.statusCode == 200) {
            print('offline_data_send_api');
            clockinofflinelist.clear();
            // print(response.data);
            BaseUrl.storage.write("offlineClockIn", '');
            clockin_check.value = true;
            clockinofflinelist.clear();
            print('offile_send');
            print(response.data);
            init();
            // Get.snackbar(
            //   "Send",
            //   "offline send ",
            // );
          } else {
            BaseUrl.storage.write("offlineClockIn", '');
            // Get.snackbar("Error", "offline failed ",
            //     colorText: Colors.white, backgroundColor: Colors.red);
          }
        }
      }
      if (sitedatalist.value.isEmpty) {
        getSites();
      }
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please fill this field";
    }
    return null;
  }

  dashboardData() async {
    Loading.value = false;
    var response = await API().DashboardData();
    if (response.statusCode == 200) {
      userdatalist = response.data['data'][0];
      BaseUrl.storage
          .write("totalAbsent", userdatalist['absent_days'].toString());
      BaseUrl.storage
          .write("totalPresent", userdatalist['present_days'].toString());
      BaseUrl.storage.write("status", userdatalist['status']);
      // BaseUrl.storage.write("isCheckOutOn", userdatalist['isClockOutOn']);
      // BaseUrl.storage.write("isCheckInOn", userdatalist['isClockInOn']);
      // print(userdatalist['isClockInOn']);
      BaseUrl.storage.write("points", userdatalist['points']);
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
      var scheduling = userdatalist['scheduling']['schedule'];
      BaseUrl.storage.write("scheduling", scheduling);
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
        // _maintenanceController.checkMaintenance();
        BaseUrl.storage.write('token', 'out');
        Get.offAllNamed(Routes.maintaince);
      }
    } else {
      Get.snackbar("Dashboard ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    update();
  }

  valueupdate(val) {
    dropdownValue.value = val;
    update();
  }

  popups({var image, var message, var isMessageAvailable, var title}) {
    if (isMessageAvailable == true) {
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
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${title.toString()}",
                  style: GoogleFonts.poppins(
                      color: Color(0xFFEE696A),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${message}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      });
    }
    update();
  }

  CurrentLocation() async {
    Loading.value = true;
    final location = new Location();
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    try {
      location.onLocationChanged.listen((LocationData cLoc) {
        center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
      });
    } catch (e) {
      Loading.value = false;
    }

    update();
  }

  Future<void> scan() async {
    try {
      final result = await BarcodeScanner.scan();
      scanResult = result;
      sites.value = scanResult!.rawContent;

      if (sites.value != "") {
        if (BaseUrl.storage.read("status") == false) {
          if (connection.value == true) {
            print(connection.value);
            clockin(check: false);
          } else {
            clockIn_offline(check: false);
          }
        } else {
          if (connection.value == true) {
            clockout(check: false);
          } else {
            clockOut_offline(check: false);
          }
        }
      } else {
        Loading.value = false;
        // Get.snackbar("Attendance", "Location is empty kindly scan again",
        //     colorText: Colors.white, backgroundColor: Colors.red);
      }
      update();
    } on PlatformException catch (e) {
      Get.snackbar("Error ", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
      Loading.value = false;
      scanResult = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'The user did not grant the camera permission!'
            : 'Unknown error: $e',
      );

      update();
    }
  }

  void clockin({var check}) async {
    // Loading.value = true;
    // update();
    var date = DateTime.now();
    // var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    await CurrentLocation();

    // if (BaseUrl.storage.read("isCheckInOn") == true) {
    if (check == false
        ? sites.value != ""
        : BaseUrl.storage.read("sitecheckpoint") != null) {
      // if (connection == true) {
      var response = await API().CheckIn(
          latlng: check == false
              ? center.value.latitude.toString() +
                  "," +
                  center.value.longitude.toString()
              : BaseUrl.storage.read("latlngcheckpoint"),
          siteId: check == false
              ? sites.value.toString()
              : BaseUrl.storage.read("sitecheckpoint"),
          check: check,
          date: outputDate);
      if (response.statusCode == 200) {
        Loading.value = false;
        BaseUrl.storage.write("ismessage", false);
        // BaseUrl.clockin = true;
        // BaseUrl.storage.write("isCheckInOn", false);
        BaseUrl.storage.write('clockincheck', date.day);
        print(BaseUrl.storage.read('clockincheck'));
        BaseUrl.storage.write("clockin", outputDate1.toString());
        BaseUrl.storage.write("clockout", "00:00");
        BaseUrl.storage.write("status", true);
        BaseUrl.storage.write("lastAttendanceRecordDate", outputDate);
        var day = outputDate.toString().split('T')[0] +
            "T" +
            BaseUrl.storage
                .read("dateForMissingCheckout")
                .toString()
                .split('T')[1];
        BaseUrl.storage.write("dateForMissingCheckout", day);
        print(BaseUrl.storage.read("dateForMissingCheckout"));

        update();

        Get.snackbar("Attendance", "Clock In Successfully");
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
      // }
    } else {
      Loading.value = false;
      // Get.snackbar("Error", "Location is empty kindly scan Qr",
      //     colorText: Colors.white, backgroundColor: Colors.red);
      // }
    }

    update();
  }

  clockout({var check}) async {
    var date = DateTime.now();
    // var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);

    // if (BaseUrl.storage.read("isCheckOutOn") == true) {
    await CurrentLocation();

    if (check == false
        ? sites.value != ""
        : BaseUrl.storage.read("sitecheckpoint") != null) {
      var response = await API().CheckOut(
          latlng: check == false
              ? center.value.latitude.toString() +
                  "," +
                  center.value.longitude.toString()
              : BaseUrl.storage.read("latlngcheckpoint"),
          siteId: check == false
              ? sites.value.toString().trim()
              : BaseUrl.storage.read("sitecheckpoint").toString(),
          date: outputDate,
          check: check);
      if (response.statusCode == 200) {
        print('bilal');
        Loading.value = false;
        popups(
            image: response.data['data'][0]['messages'][0]['imageUrl'],
            title: response.data['data'][0]['messages'][0]['title'],
            message: response.data['data'][0]['messages'][0]['message'],
            isMessageAvailable: response.data['data'][0]['isMessageAvailable']);
        // var dates = DateTime.now().day.toString() +
        //     "/" +
        //     DateTime.now().month.toString() +
        //     "/" +
        //     DateTime.now().year.toString();
        // BaseUrl.storage.write("lastAttendanceRecordDate", dates);
        BaseUrl.storage.write("lastAttendanceRecordDate", outputDate);
        BaseUrl.storage.write("status", false);

        // BaseUrl.clockout = true;
        // BaseUrl.storage.write("isCheckOutOn", false);
        BaseUrl.storage.write('clockoutcheck', date.day);
        print(BaseUrl.storage.read('clockoutcheck'));
        BaseUrl.storage.write("clockout", outputDate1.toString());

        Get.snackbar(
          "Attendance ",
          "Clock Out Successfully",
        );
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      // Get.snackbar("Error", "Location is empty kindly scan Qr",
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    // }

    update();
  }

  reasonCheckOut() async {
    BaseUrl.storage
        .write("lastAttendanceRecordDate", outputFormat.format(selectedTime));
    BaseUrl.storage.write("endTiming", initalTime);
    Loading.value = true;
    update();
    var date = DateTime.now();
    // var outputFormat = DateFormat(
    //     "${BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[2] + "-" + BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[1] + "-" + BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[0]}'T'${BaseUrl.storage.read("endTiming").toString().split(' ')[0]}:ss.SSS'Z'");
    // var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    var latlng;
    if (dropdownValue.value != "") {
      sitedatalist.value.forEach((element) async {
        if (dropdownValue.value == element['SitesName']) {
          latlng = element['location'].toString();
        }
      });

      var response = await API().Reasoncheckout(
          latlng: latlng.split(',')[0].toString() +
              "," +
              latlng.split(',')[1].toString(),
          siteId: dropdownValue.value.toString(),
          reason: reasoncontroller.text.toString().trim(),
          date: BaseUrl.storage.read("lastAttendanceRecordDate").toString());
      if (response.statusCode == 200) {
        Get.back();
        BaseUrl.storage.write('checkOutMissing', false);
        BaseUrl.storage.write("status", false);
        // BaseUrl.storage.write("isCheckInOn", true);
        Get.back();
        Loading.value = false;
        reasoncontroller.clear();
        // BaseUrl.storage.write("clockout", outputDate1.toString());

        Get.back();
        Get.snackbar(
          "Attendance ",
          "Clock Out Successfully",
        );
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error", "Dropdown value is empty kindly select",
          colorText: Colors.white, backgroundColor: Colors.red);
    }

    update();
  }

  clockIn_offline({var check}) async {
    var error = false;
    // Loading.value = true;
    Loading.value = false;
    update();
    var date = DateTime.now();
    // var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    sitedatalist.value = jsonDecode(BaseUrl.storage.read("sites_data"));
    Loading.value = false;
    print('offline_clockin');
    print(sitedatalist.value.runtimeType);
    for (var val in sitedatalist.value) {
      if (sites.value == val['SitesName'] ||
          sites.value == val['_id'] ||
          check == true) {
        Map data = {
          'location': check == false
              ? center.value.latitude.toString() +
                  "," +
                  center.value.longitude.toString()
              : BaseUrl.storage.read("latlngcheckpoint"),
          "siteId": check == false
              ? sites.value.toString()
              : BaseUrl.storage.read("sitecheckpoint"),
          "date": outputDate,
          "forceAction": check
        };
        clockin_check.value = false;
        print(data);
        BaseUrl.storage.write("ismessage", false);
        // BaseUrl.storage.write("isCheckInOn", false);
        BaseUrl.storage.write('clockincheck', date.day);
        print(BaseUrl.storage.read('clockincheck'));
        BaseUrl.storage.write("clockin", outputDate1.toString());
        BaseUrl.storage.write("clockout", "00:00");
        BaseUrl.storage.write("status", true);
        Loading.value = false;
        Get.snackbar("Attendance", "Clock In Successfully");
        BaseUrl.storage.write("lastAttendanceRecordDate", outputDate);
        var day = outputDate.toString().split('T')[0] +
            "T" +
            BaseUrl.storage
                .read("dateForMissingCheckout")
                .toString()
                .split('T')[1];
        BaseUrl.storage.write("dateForMissingCheckout", day);
        print(BaseUrl.storage.read("dateForMissingCheckout"));
        clockinofflinelist.value.add(data);
        BaseUrl.storage.write("offlineClockIn", clockinofflinelist.value);
        this.onInit();
        error = false;
        update();
        break;
      } else {
        error = true;
        update();
      }
    }
    if (error == true) {
      Get.snackbar("Error ", 'Your are not present on site',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  clockOut_offline({var check}) async {
    Loading.value = true;
    update();
    var error = false;
    var date = DateTime.now();
    // var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    print(BaseUrl.storage.read("sites_data"));
    print('offline');
    print(sites.value);
    Loading.value = false;
    for (var val in sitedatalist.value) {
      if (sites.value == val['SitesName'] ||
          sites.value == val['_id'] ||
          check == true) {
        print(true);
        Map data = {
          'location': check == false
              ? center.value.latitude.toString() +
                  "," +
                  center.value.longitude.toString()
              : BaseUrl.storage.read("latlngcheckpoint"),
          "siteId": check == false
              ? sites.value.toString()
              : BaseUrl.storage.read("sitecheckpoint"),
          "date": outputDate,
          "forceAction": check,
          "lastclockindate":
              BaseUrl.storage.read("lastAttendanceRecordDate").toString(),
          "isCheckoutForget": false
        };
        clockin_check.value = false;
        BaseUrl.storage.write("status", false);
        // BaseUrl.storage.write("isCheckOutOn", false);
        BaseUrl.storage.write('clockoutcheck', date.day);
        print(BaseUrl.storage.read('clockoutcheck'));
        BaseUrl.storage.write("clockout", outputDate1.toString());
        // print(date.toString().split(' ')[1].toString().split(':')[0]);
        // print(int.parse(
        //         BaseUrl.storage.read("clockout").toString().split(':')[0]) +
        //     12);
        // print('bilal');
        // if (data.toString().split(' ')[0].toString().split(':')[0] ==
        //     int.parse(
        //             BaseUrl.storage.read("clockout").toString().split(':')[0]) +
        //         12) {}
        clockinofflinelist.value.add(data);
        BaseUrl.storage.write("offlineClockIn", clockinofflinelist.value);
        this.onInit();
        error = false;
        update();
        break;
      } else {
        error = true;
        update();
      }
    }
    if (error == true) {
      Get.snackbar("Error ", 'Your are not present on site',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  clockReason_offline() async {
    BaseUrl.storage
        .write("lastAttendanceRecordDate", outputFormat.format(selectedTime));
    BaseUrl.storage.write(
        "endTiming",
        outputFormat.format(selectedTime).split('T')[1].split(':')[0] +
            ":" +
            outputFormat.format(selectedTime).split('T')[1].split(':')[1]);
    Loading.value = false;
    update();
    // Loading.value = true;
    // update();
    var latlng;
    var date = DateTime.now();
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    print(sitedatalist.value);
    print('offline');

    for (var val in sitedatalist.value) {
      if (dropdownValue.value != "") {
        sitedatalist.value.forEach((element) async {
          if (dropdownValue.value == element['SitesName']) {
            latlng = element['location'].toString();
          }
        });
        if (dropdownValue.value == val['SitesName']) {
          Get.back();
          print(dropdownValue.value);
          print('dropdownValue.value');
          // print(val.sitesName);
          Map data = {
            'location': latlng.split(',')[0].toString() +
                "," +
                latlng.split(',')[1].toString(),
            "siteId": dropdownValue.value.toString(),
            "date": BaseUrl.storage.read("lastAttendanceRecordDate").toString(),
            "isCheckoutForget": true,
            "reason": reasoncontroller.text.toString().trim(),
            "lastclockindate":
                BaseUrl.storage.read("lastAttendanceRecordDate").toString(),
            "points": BaseUrl.storage.read('points')
          };
          clockin_check.value = false;
          print(data);
          print("data");
          BaseUrl.storage.write('checkOutMissing', false);
          BaseUrl.storage.write("status", false);
          // BaseUrl.storage.write("isCheckInOn", true);
          clockinofflinelist.value.add(data);
          BaseUrl.storage.write("offlineClockIn", clockinofflinelist.value);
          Loading.value = false;
          reasoncontroller.clear();
          // BaseUrl.storage.write("clockout", outputDate1.toString());
          print('local_data_reason');
          Get.snackbar(
            "Attendance ",
            "Clock Out Successfully",
          );
          BaseUrl.storage.write("clockout", outputDate1.toString());
          this.onInit();
          update();
          break;
        }
        update();
      }
    }
    update();
  }

  getSites() async {
    Loading.value = true;
    update();
    // sitedatalist.value = json.decode(BaseUrl.storage.read("sites_data"));
    // print(sitedatalist.value);
    // print('sitedatalist.value');
    if (connection.value == true) {
      dropdownValue.value = '';
      var response = await API().Getsites();
      if (response.statusCode == 200) {
        sitelist.clear();
        sitedatalist.clear();
        response = await SitesModel.fromJson(response.data);
        sitedatalist.value = response.data;
        BaseUrl.storage
            .write("sites_data", await json.encode(sitedatalist.value));
        print(BaseUrl.storage.read("sites_data"));
        sitedatalist.value = json.decode(BaseUrl.storage.read("sites_data"));
        print(sitedatalist.value.runtimeType);
        for (var val in response.data) {
          sitelist.add(val.sitesName.toString());
          BaseUrl.storage.write("sites_name", sitelist);
          sitelist.sort((a, b) {
            return a.toLowerCase().compareTo(b.toLowerCase());
          });
          print(BaseUrl.storage.read("sites_name"));
        }
        dropdownValue.value = sitelist.first;
        Loading.value = false;
      } else {
        // Loading.value = false;
        Get.snackbar("Sites ", response.data['message'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      sitedatalist.value = json.decode(BaseUrl.storage.read("sites_data"));
      var ssitelist = BaseUrl.storage.read("sites_name");
      sitelist.clear();
      for (var val in ssitelist) {
        sitelist.add(val.toString());
        sitelist.sort((a, b) {
          return a.toLowerCase().compareTo(b.toLowerCase());
        });
        dropdownValue.value = sitelist.first;
      }
    }

    update();
  }

  // sendLatLng() async {
  //   final location = new Location();
  //   Position position = await Geolocator.getCurrentPosition();
  //   currentlocation.value = LatLng(position.latitude, position.longitude);
  //   try {
  //     location.onLocationChanged.listen((LocationData cLoc) {
  //       currentlocation.value = LatLng(cLoc.latitude!, cLoc.longitude!);
  //     });
  //   } catch (e) {
  //     Loading.value = false;
  //   }
  //
  //   var response = await API().Sendlatlng(
  //       latlng: currentlocation.value.latitude.toString() +
  //           ',' +
  //           currentlocation.value.longitude.toString());
  //   if (response.statusCode == 200) {
  //     print(response.data['status']);
  //   } else {}

  //   update();
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // this.dispose();
  }
}
