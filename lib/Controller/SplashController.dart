import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  var isseen;
  @override
  void onInit() {
    super.onInit();
    // BaseUrl.storage.erase();
    // TODO: implement onInit
    // await Firebase.initializeApp();
    // FirebaseCrashlytics.instance.crash();

    var tokenval = BaseUrl.storage.read("token");
    isseen = BaseUrl.storage.read('seen') ?? false;

    Future.delayed(new Duration(seconds: 3), () {
      if (tokenval != null) {
        Get.offAllNamed('/home');
      } else if (BaseUrl.storage.read('seen') == true) {
        Get.offAllNamed('/signinemp');
      } else {
        isseen = BaseUrl.storage.write('seen', true);
        Get.offAllNamed('/intro');
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
