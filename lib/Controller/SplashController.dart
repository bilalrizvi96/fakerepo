import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // BaseUrl.storage.erase();
    // TODO: implement onInit
    var tokenval = BaseUrl.storage.read("token");

    print(BaseUrl.storage.read("token"));
    print("val");
    Future.delayed(new Duration(seconds: 3), () {
      tokenval != null ? Get.offAllNamed('/home') : Get.offAllNamed('/intro');
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
