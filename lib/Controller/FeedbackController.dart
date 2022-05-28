import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class FeedbackController extends GetxController {
  var feedbackcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  final feedbackFormKey = GlobalKey<FormState>();
  var dropdownValue = 'Choose Category'.obs;
  XFile? faceImage;
  var label = ''.obs;
  var Loading = false.obs;
  final ImagePicker _picker = ImagePicker();
  var check = true;
  @override
  void onInit() {
    super.onInit();
    Loading.value = false;
    print(check);
    if (BaseUrl.storage.read('name') != null) {
      namecontroller.text =
          BaseUrl.storage.read('name').toString().toUpperCase();
      phonecontroller.text =
          BaseUrl.storage.read('phoneNo').toString().toUpperCase();
    } else {
      namecontroller.text = '';
      phonecontroller.text = '';
    }
  }

  submit(var form) async {
    // if (feedbackFormKey.currentState!.validate() &&
    //     feedbackFormKey.currentState!.validate()) {
    Loading.value = true;
    update();
    print(form);
    form == false
        ? dropdownValue.value = dropdownValue.value
        : dropdownValue.value = 'HR';
    if (dropdownValue.value != 'Choose Category') {
      if (feedbackcontroller.text.toString() != '' &&
          phonecontroller.text.toString() != '' &&
          namecontroller.text.toString() != '') {
        var response = await API().Feedback(
            empId: check != false ? BaseUrl.storage.read("empCode") : "",
            // time: date.hour.toString() +
            //     ":" +
            //     date.minute.toString() +
            //     " " +
            //     date.day.toString() +
            //     "-" +
            //     date.month.toString() +
            //     "-" +
            //     date.year.toString(),
            name: namecontroller.text.toString(),
            phone: phonecontroller.text.toString().trim(),
            message: form == false
                ? feedbackcontroller.text.toString()
                : label.value.toString() +
                    '\n' +
                    feedbackcontroller.text.toString(),
            type: form == false ? dropdownValue.value.toString() : 'HR',
            image: faceImage);
        if (response.statusCode == 200) {
          Loading.value = false;
          if (check == false) {
            dropdownValue.value = 'Choose Category';
            phonecontroller.text =
                BaseUrl.storage.read('phoneNo').toString().toUpperCase();
            // namecontroller.clear();
            faceImage = null;
            Get.back();
          } else {
            dropdownValue.value = 'Choose Category';
            faceImage = null;
            feedbackcontroller.clear();
            Get.back();
            // phonecontroller.clear();
          }

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
        Get.snackbar("Error ", "Fill the required fields".toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error ", "Please select from dropdown".toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
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
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
