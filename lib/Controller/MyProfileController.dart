import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/View/MyProfileScreen/MyProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  var firstnameController = new TextEditingController();
  var lastnameController = new TextEditingController();
  var mobileController = new TextEditingController();
  var designationController = new TextEditingController();
  var date_of_joiningController = new TextEditingController();
  var addressController = new TextEditingController();
  var email_addressController = new TextEditingController();
  var shift_timmingController = new TextEditingController();
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  var read = true.obs;

  String? validators(var values) {
    if (values.isEmpty) {
      return "Please this field must be filled";
    }
    return null;
  }

  profilecreation() async {
    if (profileFormKey.currentState!.validate() &&
        profileFormKey.currentState!.validate()) {
      var response = await API().ProfileCreation(
        address: addressController.text.toString(),
        date_of_joining: date_of_joiningController.text.toString(),
        designation: designationController.text.toString(),
        email_address: email_addressController.text.toString(),
        firstname: firstnameController.text.toString(),
        lastname: lastnameController.text.toString(),
        mobile: mobileController.text.toString(),
        shift_timming: shift_timmingController.text.toString(),
      );
      if (response != null && response != 'error') {
        print(response);
        Get.snackbar("Profile Create", "Profile Create Successfully");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();

    // for(var value in profiledata){
    //
    // }
  }
}
