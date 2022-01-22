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
      BaseUrl.empcode = employee_IdController.text;
      Get.toNamed(
        '/facerule',
      );
    }
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
    var response = await API().Registration(
        employee_Id: employee_IdController.text.toString(),
        email_address: emailController.text.toString(),
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
