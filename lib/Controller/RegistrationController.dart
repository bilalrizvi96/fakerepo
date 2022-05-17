import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
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
        Get.toNamed(
          '/facerule',
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
        Get.offNamed('/OTP');
        Loading.value = false;
      } else if (response.statusCode == 422) {
        var errorid = response.data['error'].toString().split(":");
        print(response.data['error']);
        print(response.statusCode);
        var cheaterID = errorid[1];
        var date = DateTime.now();
        await API().NotificationSend(
          empId: BaseUrl.storage.read("empCode"),
          // time: date.hour.toString() +
          //     ":" +
          //     date.minute.toString() +
          //     " " +
          //     date.day.toString() +
          //     "-" +
          //     date.month.toString() +
          //     "-" +
          //     date.year.toString(),
          message: cheaterID.toString() +
              " is trying to register on " +
              employee_IdController.text.toString(),
        );
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
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
}
