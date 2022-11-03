import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Controller/SummaryController.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
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
  var connection = true.obs;
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

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });
        // Loading.value = false;

      }
    } on SocketException catch (_) {
      connection.value = false;
      Loading.value = true;
      Future.delayed(new Duration(milliseconds: 2000), () {
        Loading.value = false;

        update();
      });
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });

        update();
      } else {
        connection.value = false;
        Loading.value = true;
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;

          update();
        });
        update();
      }
    });
    update();
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
      ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
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
      Loading.value = true;
      update();
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
        update();
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
        Get.offAndToNamed(Routes.home);
      } else {
        Loading.value = false;

        Get.snackbar("Error ", response.data['message'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar("Log In", "Kindly scan your face");

      Loading.value = false;
      // ScaffoldMessenger.of(Get.context!).clearSnackBars();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
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
