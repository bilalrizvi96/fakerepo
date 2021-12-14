import 'dart:io';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';

class SignInEmployeeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController empcodeController = new TextEditingController();
  XFile? faceImage;
  static final _auth = LocalAuthentication();
  var token = "".obs;
  var Loading = false.obs;
  var deviceId = "".obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
    // getDeviceDetails();
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticateWithBiometrics(
        localizedReason: 'Scan Fingerprint to Authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      return false;
    }
  }

  imgFromCameras() async {
    var image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 2,
        maxHeight: 100,
        maxWidth: 100);
    if (image != null) {
      faceImage = image;
      await faceverification();
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

//   Future<String> getDeviceDetails() async {
//     String deviceName;
//     String deviceVersion;
//     String identifier = "";
//     final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
//     try {
//       if (Platform.isAndroid) {
//         var build = await deviceInfoPlugin.androidInfo;
//         deviceName = build.model;
//         deviceVersion = build.version.toString();
//         identifier = build.androidId;
//         deviceId.value = build.id; //UUID for Android
//       } else if (Platform.isIOS) {
//         var data = await deviceInfoPlugin.iosInfo;
//         deviceName = data.name;
//         deviceVersion = data.systemVersion;
//         identifier = data.identifierForVendor; //UUID for iOS
//       }
//     } on PlatformException {
//       print('Failed to get platform version');
//     }
//
// //if (!mounted) return;
//     return identifier;
//   }

  checkOption(var check) async {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      BaseUrl.empcode = empcodeController.text;
      if (check == 1) {
        await sigin(true);
      } else if (check == 0) {
        Loading.value = true;

        await imgFromCameras();
      }
      update();
    }
  }

  sigin(var isface) async {
    print("deviceId");
    print(deviceId.value);
    var response = await API().SigIn(
        employee_Id: empcodeController.text.toString(),
        isFace: isface,
        device_id: deviceId.value);

    if (response.statusCode == 200) {
      Loading.value = false;

      response = await LoginModel.fromJson(response.data);
      token.value = "BEARER" + " " + response.token;
      BaseUrl.storage.write("token", token.value);
      print(BaseUrl.storage.read("token"));
      BaseUrl.storage.write("name", response.user[0].name);
      BaseUrl.storage.write("empCode", response.user[0].empCode);
      BaseUrl.storage
          .write("totalAbsent", response.user[0].absentDays.toString());
      BaseUrl.storage
          .write("totalPresent", response.user[0].presentDays.toString());
      BaseUrl.storage.write("status", response.user[0].status);
      print(BaseUrl.storage.read("status").toString());
      print("val");
      BaseUrl.storage.write("phoneNo", response.user[0].phoneNo);
      BaseUrl.storage.write("eMail", response.user[0].eMail);
      BaseUrl.storage.write("firstName", response.user[0].profile[0].firstName);
      BaseUrl.storage.write("lastName", response.user[0].profile[0].lastName);
      BaseUrl.storage.write("address", response.user[0].profile[0].address);
      BaseUrl.storage
          .write("dateOfJoining", response.user[0].profile[0].dateOfJoining);
      BaseUrl.storage
          .write("designation", response.user[0].profile[0].designation);
      BaseUrl.storage
          .write("shiftTiming", response.user[0].profile[0].shiftTiming);
      BaseUrl.storage
          .write("employeeId", response.user[0].profile[0].employeeId);

      Get.snackbar("Login ", "Login Successfully");
      Get.offAllNamed('/home');
    } else {
      Loading.value = false;

      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    // update();
  }

  faceverification() async {
    if (faceImage != null) {
      var response = await API().Face_Verification(
        verification: faceImage,
      );
      if (response.statusCode == 200) {
        print(response);

        if (response.data['respose'] == true) {
          Get.snackbar("Log In ", "Verified Successfully");
          await sigin(true);
        } else {
          Get.snackbar("Log In ", "Not Verified");
        }
      } else {
        Get.snackbar("Login ", response.data['respose'].toString());
      }
    } else {
      Get.snackbar("Log In", "Kindly enter the valid data");
    }
  }
}
