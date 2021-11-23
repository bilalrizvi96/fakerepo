import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedyear = DateTime.now().year.obs;
  var selectedmonth = DateTime.now().month.obs;
  var current = "".obs;
  @override
  void onInit() {
    super.onInit();
    current.value =
        selectedmonth.value.toString() + "-" + selectedyear.value.toString();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
