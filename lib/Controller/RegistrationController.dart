import 'package:attendencesystem/API/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var employee_IdController = new TextEditingController();
  var emailController = new TextEditingController();
  final registrationFormKey = GlobalKey<FormState>();
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
      if (response != null && response != 'error') {
        print(response);
        Get.snackbar("Registration ", "Register Successfully");
      } else {}
    }
  }
}
