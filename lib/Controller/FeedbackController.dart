import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class FeedbackController extends GetxController {
  var feedbackcontroller = TextEditingController();
  var feedbackFormKey = GlobalKey<FormState>();
  submit() async {
    if (feedbackFormKey.currentState!.validate() &&
        feedbackFormKey.currentState!.validate()) {
      var date = DateTime.now();
      var response = await API().Feedback(
        empId: BaseUrl.storage.read("empCode"),
        time: date.hour.toString() + ":" + date.minute.toString(),
        message: feedbackcontroller.text.toString(),
      );
      if (response.statusCode == 200) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
  }

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }
}
