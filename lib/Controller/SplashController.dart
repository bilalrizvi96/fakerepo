import 'dart:async';

import 'package:attendencesystem/API/API.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var val = API().storage.read("token");
    print(val);
    Future.delayed(new Duration(seconds: 3), () {
      API().storage.read("token") != null
          ? Get.offNamed('/home')
          : Get.offNamed('/intro');
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
