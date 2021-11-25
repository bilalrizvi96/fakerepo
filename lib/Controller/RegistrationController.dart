import 'package:attendencesystem/API/API.dart';

import 'package:flutter/cupertino.dart';
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
      var response = await API().Registration(
        employee_Id: employee_IdController.text.toString(),
        email_address: emailController.text.toString(),
      );
      if (response.statusCode == 200) {
        print(response);
        Get.snackbar("Registration ", "Register Successfully");
        Get.offAllNamed('/OTP');
      } else {
        Get.snackbar("Registration ", response.toString());
      }
    }
  }
}
