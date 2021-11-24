import 'dart:async';

import 'package:attendencesystem/API/API.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    var val = API().storage.read("token");
    print(val);
    Future.delayed(new Duration(seconds: 3), () {
      val != null ? Get.offNamed('/home') : Get.offNamed('/intro');
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
