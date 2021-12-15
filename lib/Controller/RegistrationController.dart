import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var employee_IdController = new TextEditingController();
  var emailController = new TextEditingController();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
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

  submit(var check) async {
    var response = await API().Registration(
        employee_Id: employee_IdController.text.toString(),
        email_address: emailController.text.toString(),
        check: true);
    if (response.statusCode == 200) {
      Get.offAllNamed('/OTP');
      print(response);
      Get.snackbar("Registration ", "Register Successfully");

      // Get.offAllNamed('/home');
    } else {
      Get.back();
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);

      // Get.offAllNamed('/signinemp');
    }
  }
}
