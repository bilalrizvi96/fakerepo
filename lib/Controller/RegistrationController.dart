import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {
  var employee_IdController = new TextEditingController();
  var emailController = new TextEditingController();
  var registrationFormKey = GlobalKey<FormState>();
  XFile? faceImage;
  final ImagePicker _picker = ImagePicker();
  var Loading = false.obs;
  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

  imgFromCameras() async {
    var image = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 1024,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      faceImage = image;
      Loading.value = true;
      update();
      await faceverification();
    } else {
      Loading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
    update();
    // getDeviceDetails();
  }

  registration() async {
    if (registrationFormKey.currentState!.validate() &&
        registrationFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      BaseUrl.empcode = employee_IdController.text;
      var emailsplit = emailController.text.toString().split("@");
      var email = emailsplit[0] + '@starmarketingonline.com';
      var response = await API().RegistrationConfirmation(
        employee_Id: employee_IdController.text.toString(),
        email_address: email,
      );
      if (response.statusCode == 200) {
        Loading.value = false;
        Get.toNamed(
          '/facerule',
        );
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);

        // Get.offAllNamed('/signinemp');
      }
    }
    update();
  }

  faceverification() async {
    if (faceImage != null) {
      var response = await API().Face_Registration(
        files: faceImage,
      );
      if (response.statusCode == 200) {
        print(response);
        await submit();
        Loading.value = false;
      } else {
        Get.snackbar("Error ", response.data['respose'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
        Loading.value = false;
      }
    } else {
      Get.snackbar("Registered", "Kindly enter the valid data",
          colorText: Colors.white, backgroundColor: Colors.red);
      Loading.value = false;
    }
  }

  submit() async {
    var emailsplit = emailController.text.toString().split("@");
    var email = emailsplit[0] + '@starmarketingonline.com';
    print(email);
    print("email");
    var response = await API().Registration(
        employee_Id: employee_IdController.text.toString(),
        email_address: email,
        check: true);
    if (response.statusCode == 200) {
      Get.offAllNamed('/OTP');
      print(response);
      Get.snackbar("Registered ", "Register Successfully");

      // Get.offAllNamed('/home');
    } else {
      Get.back();
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);

      // Get.offAllNamed('/signinemp');
    }
  }
}
