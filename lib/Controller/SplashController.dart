import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(new Duration(seconds: 3), () {
      Get.offNamed('/intro');
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
