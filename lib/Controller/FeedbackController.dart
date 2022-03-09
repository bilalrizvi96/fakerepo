import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class FeedbackController extends GetxController {
  var feedbackcontroller = TextEditingController();
  var feedbackFormKey = GlobalKey<FormState>();
  var dropdownValue = 'Select'.obs;
  XFile? faceImage;
  var Loading = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
  }

  submit() async {
    if (feedbackFormKey.currentState!.validate() &&
        feedbackFormKey.currentState!.validate()) {
      Loading.value = true;
      update();
      if (dropdownValue.value != 'Select') {
        var date = DateTime.now();
        var response = await API().Feedback(
            empId: BaseUrl.storage.read("empCode"),
            time: date.hour.toString() + ":" + date.minute.toString(),
            message: feedbackcontroller.text.toString(),
            type: dropdownValue.value.toString(),
            image: faceImage);
        if (response.statusCode == 201) {
          Loading.value = false;
          Get.offAllNamed('/home');
          Get.snackbar(
            "Feedback",
            "Thank You for your feedback",
          );
        } else {
          Loading.value = false;
          Get.snackbar("Error ", response.data['error'].toString(),
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        Loading.value = false;
        Get.snackbar("Error ", "Please select from dropdown".toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
    update();
  }

  valueupdate(val) {
    dropdownValue.value = val;
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
        source: ImageSource.gallery,
        maxHeight: 1024,
        preferredCameraDevice: CameraDevice.front,
        maxWidth: 1024);
    if (image != null) {
      faceImage = image;
    } else {}
    update();
  }
}
