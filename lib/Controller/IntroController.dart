import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  var opacityLevel = 1.0.obs;
  var controller = PageController().obs;
  var pageIndex = 0.obs;
  changeOpacity() {
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  pagechange(value) {
    pageIndex.value = value;
    update();
  }
}
