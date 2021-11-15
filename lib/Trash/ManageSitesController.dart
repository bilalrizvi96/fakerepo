// import 'package:attendencesystem/API/API.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ManageSitesController extends GetxController {
//   var dropdownValue = 'Select Profession'.obs;
//   var sitesNameController = new TextEditingController();
//   var addressController = new TextEditingController();
//   var cityController = new TextEditingController();
//   final managesitesFormKey = GlobalKey<FormState>();
//   var qrData = "".obs;
//   String? validators(var values) {
//     if (values.isEmpty) {
//       return "Please this field must be filled";
//     }
//     return null;
//   }
//
//   valueupdate(val) {
//     dropdownValue.value = val;
//     update();
//   }
//
//   sitecreation() async {
//     if (managesitesFormKey.currentState!.validate() &&
//         managesitesFormKey.currentState!.validate()) {
//       if (dropdownValue.value != "Select Profession") {
//         var response = await API().SiteCreation(
//           address: addressController.text.toString(),
//           sitename: sitesNameController.text.toString(),
//           city: cityController.text.toString(),
//           type: dropdownValue.value.toString(),
//         );
//         if (response != null && response != 'error') {
//           print(response);
//           qrData.value = await response['SitesName'];
//           print('/genrateqr?data=${qrData.value}');
//           Get.toNamed('/genrateqr?data=${qrData.value}');
//           Get.snackbar("Site Create", "Sites Create Successfully");
//         }
//       } else {
//         Get.snackbar("Profile Create", "Please Select Type");
//       }
//     }
//   }
// }
