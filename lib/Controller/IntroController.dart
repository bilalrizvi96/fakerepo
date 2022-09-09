import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  var controller = PageController().obs;
  var pageIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  pagechange(value) {
    pageIndex.value = value;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    this.dispose();
  }
}
