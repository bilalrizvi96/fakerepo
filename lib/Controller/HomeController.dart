import 'package:attendencesystem/Model/SitesModel.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API/BaseURl.dart';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'SignInEmployeeController.dart';
import 'SummaryController.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  var name;
  var updates = false.obs;
  var center = new LatLng(33.652100, 75.123398).obs;
  ScanResult? scanResult;
  var sites = "".obs;
  var url = ''.obs;
  SignInEmployeeController _signInEmployeeController =
      Get.put(SignInEmployeeController());
  var clockindate;
  var clockindate2;
  var Loading = false.obs;
  var dropdownValue = ''.obs;
  var reasonFormKey = GlobalKey<FormState>();
  var reasoncontroller = TextEditingController();
  List<String> sitelist = [];
  SummaryController _summaryController = Get.put(SummaryController());
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
  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
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
    final location = new Location();
    Position position = await Geolocator.getCurrentPosition();
    center.value = LatLng(position.latitude, position.longitude);
    location.onLocationChanged.listen((LocationData cLoc) {
      center.value = LatLng(cLoc.latitude!, cLoc.longitude!);
    });

    update();
  }

  Future<void> scan() async {
    try {
      final result = await BarcodeScanner.scan();
      scanResult = result;
      sites.value = scanResult!.rawContent;
      if (sites.value != "") {
        if (BaseUrl.storage.read("status") == false) {
          clockin(check: false);
        } else {
          clockout(check: false);
        }
        // Get.toNamed('/attendance');
      } else {
        Loading.value = false;
        Get.snackbar("Attendance", "Location is empty kindly scan again",
            colorText: Colors.white, backgroundColor: Colors.red);
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
    Loading.value = true;
    update();
    var date = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    if (check == false) {
      await CurrentLocation();
      var status = await Permission.location.status;
      if (status.isGranted) {
        await CurrentLocation();
        print(outputDate.toString());
        if (sites.value != "") {
          var response = await API().CheckIn(
              latlng: center.value.latitude.toString() +
                  "," +
                  center.value.longitude.toString(),
              siteId: sites.value.toString(),
              check: check,
              date: outputDate);
          if (response.statusCode == 200) {
            Loading.value = false;
            BaseUrl.storage.write("ismessage", false);
            BaseUrl.clockin = outputDate1.toString();
            BaseUrl.storage.write("clockin", BaseUrl.clockin);
            BaseUrl.storage.write("clockout", "00:00");
            BaseUrl.storage.write("status", true);
            var resp = await API().AbsentPresent();
            if (resp.statusCode == 200) {
              print('bilal');

              BaseUrl.storage
                  .write("totalPresent", resp.data['present_days'].toString());
              BaseUrl.storage
                  .write("totalAbsent", resp.data['absent_days'].toString());
            }

            var dates = DateTime.now().day.toString() +
                "/" +
                DateTime.now().month.toString() +
                "/" +
                DateTime.now().year.toString();
            var day = outputDate.toString().split('T')[0] +
                "T" +
                BaseUrl.storage
                    .read("dateForMissingCheckout")
                    .toString()
                    .split('T')[1];
            BaseUrl.storage.write("lastAttendanceRecordDate", dates);
            BaseUrl.storage.write("dateForMissingCheckout", day);
            print(BaseUrl.storage.read("dateForMissingCheckout"));
            // _summaryController.init();
            update();
            // Get.back();
            Get.snackbar("Attendance", "Clock In Successfully");
          } else {
            Loading.value = false;
            Get.snackbar("Error ", response.data['error'].toString(),
                colorText: Colors.white, backgroundColor: Colors.red);
          }
        } else {
          Loading.value = false;
          Get.snackbar("Error", "Location is empty kindly scan Qr",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        Loading.value = false;
        Get.snackbar("Error ",
            'The user did not grant the location permission!'.toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      var response = await API().CheckIn(
          siteId: BaseUrl.storage.read("sitecheckpoint"),
          latlng: BaseUrl.storage.read("latlngcheckpoint"),
          date: outputDate,
          check: check);
      if (response.statusCode == 200) {
        Loading.value = false;
        BaseUrl.storage.write("ismessage", false);
        BaseUrl.clockin = outputDate1.toString();
        BaseUrl.storage.write("clockin", BaseUrl.clockin);
        BaseUrl.storage.write("clockout", "00:00");
        BaseUrl.storage.write("status", true);
        var resp = await API().AbsentPresent();
        if (resp.statusCode == 200) {
          // _summaryController.init();

          print('bilal');

          BaseUrl.storage
              .write("totalPresent", resp.data['present_days'].toString());
          BaseUrl.storage
              .write("totalAbsent", resp.data['absent_days'].toString());
        }

        var dates = DateTime.now().day.toString() +
            "/" +
            DateTime.now().month.toString() +
            "/" +
            DateTime.now().year.toString();
        var day = outputDate.toString().split('T')[0] +
            "T" +
            BaseUrl.storage
                .read("dateForMissingCheckout")
                .toString()
                .split('T')[1];
        BaseUrl.storage.write("lastAttendanceRecordDate", dates);
        BaseUrl.storage.write("dateForMissingCheckout", day);
        print(BaseUrl.storage.read("dateForMissingCheckout"));
        // _summaryController.init();
        update();
        // Get.back();
        Get.snackbar("Attendance", "Clock In Successfully");
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
    update();
  }

  // getSites() async {
  //   var response = await API().Getsites();
  //   if (response.statusCode == 200) {
  //     Loading.value = false;
  //     response = await SitesModel.fromJson(response.data);
  //     for (var val in response.data) {
  //       sitelist.add(val.sitesName.toString());
  //       sitelist.sort((a, b) {
  //         return a.toLowerCase().compareTo(b.toLowerCase());
  //       });
  //     }
  //
  //     dropdownValue.value = sitelist.first;
  //     print(sitelist);
  //   } else {
  //     Loading.value = false;
  //     Get.snackbar("Error ", response.data['message'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  //   update();
  // }

  clockout({var check}) async {
    Loading.value = true;
    update();
    var date = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);
    if (check == false) {
      await CurrentLocation();
      if (sites.value != "") {
        var response = await API().CheckOut(
            latlng: center.value.latitude.toString() +
                "," +
                center.value.longitude.toString(),
            siteId: sites.value.toString().trim(),
            date: outputDate,
            check: check);
        if (response.statusCode == 200) {
          // _summaryController.init();

          print('bilal');
          popups(
              image: response.data['data'][0]['messages'][0]['imageUrl'],
              title: response.data['data'][0]['messages'][0]['title'],
              message: response.data['data'][0]['messages'][0]['message'],
              isMessageAvailable: response.data['data'][0]
                  ['isMessageAvailable']);
          var dates = DateTime.now().day.toString() +
              "/" +
              DateTime.now().month.toString() +
              "/" +
              DateTime.now().year.toString();
          BaseUrl.storage.write("lastAttendanceRecordDate", dates);
          BaseUrl.storage.write("status", false);
          Loading.value = false;
          BaseUrl.clockout = outputDate1.toString();
          BaseUrl.storage.write("clockout", BaseUrl.clockout);

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
        Get.snackbar("Error", "Location is empty kindly scan Qr",
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      var response = await API().CheckOut(
          siteId: BaseUrl.storage.read("sitecheckpoint"),
          latlng: BaseUrl.storage.read("latlngcheckpoint"),
          date: outputDate,
          check: check);
      if (response.statusCode == 200) {
        // _summaryController.init();
        BaseUrl.storage.write("status", false);
        Loading.value = false;
        BaseUrl.clockout = outputDate1.toString();
        BaseUrl.storage.write("clockout", BaseUrl.clockout);
        popups(
            image: response.data['data'][0]['messages'][0]['imageUrl'],
            title: response.data['data'][0]['messages'][0]['title'],
            message: response.data['data'][0]['messages'][0]['message'],
            isMessageAvailable: response.data['data'][0]['isMessageAvailable']);
        var dates = DateTime.now().day.toString() +
            "/" +
            DateTime.now().month.toString() +
            "/" +
            DateTime.now().year.toString();
        BaseUrl.storage.write("lastAttendanceRecordDate", dates);
        Get.snackbar(
          "Attendance ",
          "Clock Out Successfully",
        );
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }

    update();
  }

  // checkUpdate() async {
  //   var response = await API().CheckUpdate();
  //   if (response.statusCode == 200) {
  //     updates.value = response.data['response']['updateAvailability'];
  //     if (updates.value == true) {
  //       Get.offAllNamed('/updatescreen');
  //       url.value = response.data['response']['link'];
  //
  //       BaseUrl.url = url.value;
  //       BaseUrl.message = response.data['response']['message'];
  //       BaseUrl.currentRelease = response.data['response']['currentRelease'];
  //       BaseUrl.availableRelease =
  //           response.data['response']['availableRelease'];
  //     } else {
  //       clockin(check: false);
  //     }
  //     // checks();
  //   } else {
  //     Get.snackbar("Error ", response.data['error'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  // }

  reasonCheckOut() async {
    Loading.value = true;
    update();

    var date = DateTime.now();
    var outputFormat = DateFormat(
        "${BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[2] + "-" + BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[1] + "-" + BaseUrl.storage.read("lastAttendanceRecordDate").toString().replaceAll('/', '-').split('-')[0]}'T'${BaseUrl.storage.read("endTiming").toString().split(' ')[0]}:ss.SSS'Z'");
    var outputDate = outputFormat.format(date);
    var outputFormat1 = DateFormat('hh:mm a');
    var outputDate1 = outputFormat1.format(date);

    await CurrentLocation();
    // if (reasonFormKey.currentState!.validate() &&
    //     reasonFormKey.currentState!.validate()) {
    if (dropdownValue.value != "") {
      var response = await API().Reasoncheckout(
          latlng: center.value.latitude.toString() +
              "," +
              center.value.longitude.toString(),
          siteId: dropdownValue.value.toString(),
          reason: reasoncontroller.text.toString().trim(),
          date: outputDate);
      if (response.statusCode == 200) {
        BaseUrl.storage.write("status", false);
        Get.back();
        Loading.value = false;
        reasoncontroller.clear();
        BaseUrl.clockout = outputDate1.toString();
        BaseUrl.storage.write("clockout", BaseUrl.clockout);
        var dates = date.year.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.day.toString();
        BaseUrl.storage.write("lastAttendanceRecordDate", dates);
        print(BaseUrl.storage.read("lastAttendanceRecordDate"));
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
    // }
    update();
  }

  init() async {
    // print(BaseUrl.userdata[0].sites);
    Loading.value = false;
    current.value =
        months[selectedmonth.value - 1] + "-" + selectedyear.value.toString();
    var nam = BaseUrl.storage.read('name').toString().split(' ');
    name = nam[0].toString();
    for (int val = 0; val < _signInEmployeeController.sitelist.length; val++) {
      sitelist
          .add(_signInEmployeeController.sitelist[val].sitesName.toString());
      sitelist.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
    }

    dropdownValue.value = "sitelist.first";
  }

  @override
  void onInit() {
    super.onInit();
    init();
    // getSites();
  }
}
