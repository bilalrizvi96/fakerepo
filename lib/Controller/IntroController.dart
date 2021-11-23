import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroController extends GetxController {
  var opacityLevel = 1.0.obs;
  var controller = PageController().obs;
  var pageIndex = 0.obs;
  changeOpacity() {
    // opacityLevel.value = opacityLevel.value == 0 ? 1.0 : 0.5;

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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
