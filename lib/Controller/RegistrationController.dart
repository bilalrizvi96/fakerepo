import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Routes/Routes.dart';

class RegistrationController extends GetxController {
  var employee_IdController = new TextEditingController();
  var emailController = new TextEditingController();
  var registrationFormKey = GlobalKey<FormState>();
  XFile? faceImage;
  final ImagePicker _picker = ImagePicker();
  var Loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
    update();
  }

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

  registration() async {
    BaseUrl.storage.write("empCode", employee_IdController.text.toString());
    if (registrationFormKey.currentState!.validate() &&
        registrationFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      BaseUrl.empcode = employee_IdController.text;

      var response = await API().RegistrationConfirmation(
        employee_Id: employee_IdController.text.toString(),
        email_address: emailController.text.toString(),
      );
      if (response.statusCode == 200) {
        Loading.value = false;
        BaseUrl.storage.write('phone', response.data['data']['phone']);
        print(BaseUrl.storage.read('phone'));
        Get.toNamed(
          Routes.facerule,
        );
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
    update();
  }

  faceverification() async {
    BaseUrl.storage.write("empCode", employee_IdController.text.toString());
    if (faceImage != null) {
      var response = await API().Face_Registration(
        files: faceImage,
      );
      if (response.statusCode == 200) {
        Get.offNamed(Routes.OTP);
        Loading.value = false;
      } else {
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);

        Loading.value = false;
      }
    } else {
      Get.snackbar("Registered", "Kindly enter the valid data",
          colorText: Colors.white, backgroundColor: Colors.red);
      Loading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    this.dispose();
  }
}
