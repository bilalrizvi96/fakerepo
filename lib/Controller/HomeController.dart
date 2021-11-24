import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/Controller/SignInEmployeeController.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  var name = "".obs;

  var userdata = [];
  @override
  void onInit() {
    super.onInit();
    current.value =
        selectedmonth.value.toString() + "-" + selectedyear.value.toString();
    userdata = API().storage.read("users");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
