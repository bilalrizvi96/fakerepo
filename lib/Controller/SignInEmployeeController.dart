import 'dart:convert';
import 'dart:math';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/LoginModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignInEmployeeController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController empcodeController = new TextEditingController();
  XFile? faceImage;

  var token = "".obs;
  var Loading = false.obs;
  var deviceId = "".obs;
  var value;
  var encoded = ''.obs;
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

    //
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

  checkOption() async {
    if (loginFormKey.currentState!.validate() &&
        loginFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      BaseUrl.empcode = empcodeController.text;

      await imgFromCameras();

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
    //print("deviceId");
    Random random = new Random();
    int randomNumber = random.nextInt(1000);
    int randomNumber2 = random.nextInt(10000);
    //print(randomNumber.bitLength);
    //print(randomNumber2.bitLength);
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

    String credentials = value;
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    encoded.value = stringToBase64.encode(credentials);

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
      BaseUrl.storage.write("starttime", response.user[0].startTiming);
      BaseUrl.storage.write("endTiming", response.user[0].endTiming);
      BaseUrl.storage.write("hoursPerWeek", response.user[0].hoursPerWeek);
      BaseUrl.storage.write("offDay", response.user[0].offDay);
      BaseUrl.storage.write("phoneNo", response.user[0].phoneNo);
      BaseUrl.storage.write("eMail", response.user[0].eMail);
      BaseUrl.storage.write("address", response.user[0].address);
      BaseUrl.storage.write("designation", response.user[0].designation);
      BaseUrl.storage.write("shiftTiming", response.user[0].shiftType);
      BaseUrl.storage.write("clockin", response.user[0].checkIn);
      BaseUrl.storage.write("points", response.user[0].points);
      BaseUrl.storage
          .write("checkpointaccess", response.user[0].checkpointAccess);
      BaseUrl.storage.write("welcomemessage", response.user[0].message.message);
      BaseUrl.storage.write("welcometitle", response.user[0].message.title);
      BaseUrl.storage.write("clockout", response.user[0].checkOut);
      BaseUrl.storage.write("firstAttendanceRecordDate",
          response.user[0].firstAttendanceRecordDate);
      BaseUrl.storage.write("ismessage", response.user[0].isMessageAvailable);
      BaseUrl.storage.write("popupimage", response.user[0].message.imageUrl);

      BaseUrl.storage.write("firstAttendanceRecordDate",
          response.user[0].firstAttendanceRecordDate);
      BaseUrl.storage.write("lastAttendanceRecordDate",
          response.user[0].lastAttendanceRecordDate);
      BaseUrl.storage.write(
          "dateForMissingCheckout", response.user[0].dateForMissingCheckout);

      Get.snackbar("Login ", "Login Successfully");
      Get.offAllNamed('/home');
    } else {
      Loading.value = false;

      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  faceverification() async {
    if (faceImage != null) {
      var response = await API().Face_Verification(
        verification: faceImage,
      );
      if (response.statusCode == 200) {
        Get.snackbar("Log In ", "Verified Successfully");
        await sigin(true);
      } else {
        Get.snackbar("Login ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
        Loading.value = false;
      }
    } else {
      Get.snackbar("Log In", "Kindly enter the valid data");
      Loading.value = false;
    }
  }
}
