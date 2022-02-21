import 'dart:convert';
import 'dart:math';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/LoginModel.dart';
import 'package:camera/camera.dart';

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
  var encoded = ''.obs;
  List<int>? imageBytes;
  String? imageBase64;
  var loginFormKey = GlobalKey<FormState>();

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
    if (BaseUrl.storage.read("empCode") != null) {
      empcodeController.text = BaseUrl.storage.read("empCode").toString();
    }

    //
  }

  // static Future<List<BiometricType>> getBiometrics() async {
  //   try {
  //     return await _auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     return <BiometricType>[];
  //   }
  // }

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
        maxHeight: 1024,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      faceImage = image;

      await faceverification();
    } else {
      Loading.value = false;
    }
    update();
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

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

  siginbtn() {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      Get.snackbar("Log In", "Kindly scan your face",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  var value;
  randomss() {
    print("deviceId");
    Random random = new Random();
    int randomNumber = random.nextInt(1000);
    int randomNumber2 = random.nextInt(10000);
    print(randomNumber.bitLength);
    print(randomNumber2.bitLength);
    if ("$randomNumber".length == 3 && "$randomNumber2".length == 4) {
      value = "${randomNumber.toString()}" +
          "np@U'vgy99`K`;^NcxRb" +
          "${randomNumber2.toString()}";
    } else {
      randomss();
    }
  }

  sigin(var isface) async {
    randomss();
    print(value);
    String credentials = value;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    encoded.value = stringToBase64.encode(credentials);
    String decoded = stringToBase64.decode(encoded.value);
    print(encoded.value);
    print(decoded);
    print(deviceId.value);

    var response = await API().SigIn(
        employee_Id: empcodeController.text.toString(),
        isFace: isface,
        hash: encoded.value);

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
          .write("shiftTiming", response.user[0].profile[0].shiftType);
      BaseUrl.storage.write("employeeId", response.user[0].profile[0].empCode);
      BaseUrl.storage.write("clockin", response.user[0].checkIn);
      BaseUrl.storage.write("clockout", response.user[0].checkOut);

      Get.snackbar("Login ", "Login Successfully");
      Get.offAllNamed('/home');
    } else {
      Loading.value = false;
      print(response.data['error'].toString());
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
        Get.snackbar("Log In ", "Verified Successfully");
        await sigin(true);
      } else {
        Get.snackbar("Login ", response.data['respose'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
        Loading.value = false;
      }
    } else {
      Get.snackbar("Log In", "Kindly enter the valid data");
      Loading.value = false;
    }
  }
}
