import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:device_info_plus/device_info_plus.dart';
// import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

import '../Routes/Routes.dart';
import 'MaintenanceController.dart';

class SignInEmployeeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController empcodeController = new TextEditingController();
  XFile? faceImage;
  var token = "".obs;
  var Loading = false.obs;
  var value;
  var encoded = ''.obs;
  var sitelist;
  List<int>? imageBytes;
  String? imageBase64;
  var loginFormKey = GlobalKey<FormState>();
  var read = false.obs;

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;

    if (BaseUrl.storage.read("empCode") != null) {
      empcodeController.text = BaseUrl.storage.read("empCode").toString();
      read.value = true;
      update();
    } else {
      read.value = false;
      update();
    }

    ///recent
    // sitelist = BaseUrl.storage.read('sitesdata');
  }

  empcodeUpdate() {
    read.value = false;
    empcodeController.text = '';
    empcodeController.clear();

    update();
  }

  imgFromCameras() async {
    var image = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 1024,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      faceImage = image;

      await sigin();
    } else {
      Loading.value = false;
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "This field must be filled";
    }
    return null;
  }

  checkOption() async {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      BaseUrl.empcode = empcodeController.text;
      // if (await Permission.camera.request().isGranted) {
      await imgFromCameras();
      // } else {
      //   Loading.value = false;
      //   Get.snackbar("Error ", 'Kindly grant the camera permission!'.toString(),
      //       colorText: Colors.white, backgroundColor: Colors.red);
      // }

      update();
    }
  }

  siginbtn() {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      Get.snackbar("Log In", "Kindly scan your face",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  randomss() {
    Random random = new Random();
    int randomNumber = random.nextInt(1000);
    int randomNumber2 = random.nextInt(10000);

    if ("$randomNumber".length == 3 && "$randomNumber2".length == 4) {
      value = "${randomNumber.toString()}" +
          "np@U'vgy99`K`;^NcxRb" +
          "${randomNumber2.toString()}";
    } else {
      randomss();
    }
  }

  sigin() async {
    if (faceImage != null) {
      randomss();
      var info, devicename;
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        info = await deviceInfo.androidInfo;
        devicename = 'android';
      } else if (Platform.isIOS) {
        info = await deviceInfo.iosInfo;
        devicename = 'ios';
      }

      String credentials = value;
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      encoded.value = stringToBase64.encode(credentials);
      var responses = await API().GetIp();
      if (responses.statusCode == 200) {
        print(responses.data);
      }
      var response = await API().SigIn(
          employee_Id: empcodeController.text.toString(),
          model: info.model,
          devicename: devicename,
          ip: responses.data,
          image: faceImage,
          hash: encoded.value);

      if (response.statusCode == 200) {
        Loading.value = false;
        response = await LoginModel.fromJson(response.data);

        // userdatalist = response.user;
        // if (BaseUrl.storage.read("empCode") !=
        //     empcodeController.text.toString()) {
        //   BaseUrl.empcheck = false;
        //   update();
        // } else {
        //   BaseUrl.empcheck = true;
        // }

        token.value = "BEARER" + " " + response.token;
        BaseUrl.storage.write("checkpointaccess",
            response.user[0].accessPermissions[0].permissions[0].view);
        BaseUrl.storage.write("trackuseraccess",
            response.user[0].accessPermissions[0].permissions[1].view);
        BaseUrl.storage.write("token", token.value);
        print(BaseUrl.storage.read("token"));
        BaseUrl.storage.write("empCode", response.user[0].empCode);
        BaseUrl.storage.write("name", response.user[0].name);
        BaseUrl.storage.write("lastAttendanceRecordDate",
            response.user[0].lastAttendanceRecordDate.toString());
        BaseUrl.storage.write("dateForMissingCheckout",
            response.user[0].dateForMissingCheckout.toString());
        BaseUrl.storage.write("firstAttendanceRecordDate",
            response.user[0].firstAttendanceRecordDate);
        print(BaseUrl.storage.read("firstAttendanceRecordDate"));
        print('bilal');
        // BaseUrl.storage.write("role", response.user[0].role);
        // BaseUrl.storage.write("region", response.user[0].region);

        // BaseUrl.storage
        //     .write("totalAbsent", response.user[0].absentDays.toString());
        // BaseUrl.storage
        //     .write("totalPresent", response.user[0].presentDays.toString());
        // BaseUrl.storage.write("status", response.user[0].status);
        // BaseUrl.storage.write("isCheckOutOn", response.user[0].isCheckOutOn);
        // BaseUrl.storage.write("isCheckInOn", response.user[0].isCheckInOn);
        // BaseUrl.storage.write("starttime", response.user[0].startTiming);
        // BaseUrl.storage.write("endTiming", response.user[0].endTiming);
        // BaseUrl.storage.write("hoursPerWeek", response.user[0].hoursPerWeek);
        // // BaseUrl.storage.write("offDay", response.user[0].offDay);
        // BaseUrl.storage.write("phoneNo", response.user[0].phoneNo);
        // BaseUrl.storage.write("eMail", response.user[0].eMail);
        // BaseUrl.storage.write("address", response.user[0].address);
        // BaseUrl.storage.write("designation", response.user[0].designation);
        // BaseUrl.storage.write("shiftTiming", response.user[0].shiftType);
        // BaseUrl.storage.write("clockin", response.user[0].checkIn);
        // BaseUrl.storage.write("points", response.user[0].points);

        // BaseUrl.storage
        //     .write("welcomemessage", response.user[0].message.message);
        // BaseUrl.storage.write("welcometitle", response.user[0].message.title);
        // BaseUrl.storage.write("clockout", response.user[0].checkOut);
        // BaseUrl.storage.write("firstAttendanceRecordDate",
        //     response.user[0].firstAttendanceRecordDate);
        // BaseUrl.storage.write("ismessage", response.user[0].isMessageAvailable);
        // BaseUrl.storage.write("popupimage", response.user[0].message.imageUrl);
        // BaseUrl.storage.write(
        //     "maintenance", userdatalist[0].maintenanceObject.underMaintenance);
        //
        // BaseUrl.storage.write("firstAttendanceRecordDate",
        //     response.user[0].firstAttendanceRecordDate);
        // BaseUrl.storage
        //     .write("checkOutMissing", response.user[0].checkOutMissing);
        // BaseUrl.storage.write("lastAttendanceRecordDate",
        //     response.user[0].lastAttendanceRecordDate);
        // BaseUrl.storage.write(
        //     "dateForMissingCheckout", response.user[0].dateForMissingCheckout);
        // print(BaseUrl.storage.read('trackuseraccess'));

        // if (userdatalist.isNotEmpty) {
        //   if (userdatalist[0].version.updateAvailability == true) {
        //     BaseUrl.storage.write("token", 'out');
        //     Get.offAllNamed('/updatescreen', arguments: [
        //       userdatalist[0].version.message,
        //       userdatalist[0].version.currentRelease,
        //       userdatalist[0].version.availableRelease,
        //       userdatalist[0].version.link,
        //     ]);
        //   } else if (userdatalist[0].maintenanceObject.underMaintenance ==
        //       true) {
        //     _maintenanceController.checkMaintenance();
        //   } else {
        // if(BaseUrl.storage.read('key')!=empcodeController.text.toString()){
        //
        // }

        Get.offAllNamed(Routes.home);
        // }
        // }
      } else {
        Loading.value = false;

        Get.snackbar("Error ", response.data['message'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar("Log In", "Kindly scan your face");
      Loading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    this.dispose();
  }
  // faceverification() async {
  //   if (faceImage != null) {
  //     // var response = await API().Face_Verification(
  //     //   verification: faceImage,
  //     // );
  //     // if (response.statusCode == 200) {
  //     await sigin();
  //     // } else {
  //     //   Get.snackbar("Login ", response.data['error'].toString(),
  //     //       colorText: Colors.white, backgroundColor: Colors.red);
  //     //   Loading.value = false;
  //     // }
  //   } else {
  //     Get.snackbar("Log In", "Kindly enter the valid data");
  //     Loading.value = false;
  //   }
  // }
}
