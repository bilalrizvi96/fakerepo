import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // BaseUrl.storage.erase();
    // TODO: implement onInit
    // await Firebase.initializeApp();
    // FirebaseCrashlytics.instance.crash();

    var tokenval = BaseUrl.storage.read("token");
    BaseUrl.storage1.read('seen') ?? false;
    Future.delayed(new Duration(seconds: 3), () {
      print(tokenval != null);
      print(tokenval != "out");
      if (tokenval != "out") {
        if (tokenval != null) {
          Get.offAllNamed('/home');
        } else {
          BaseUrl.storage1.write('seen', true);
          Get.offAllNamed('/intro');
        }
      } else if (BaseUrl.storage1.read('seen') == true) {
        Get.offAllNamed('/signinemp');
      } else {
        BaseUrl.storage1.write('seen', true);
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
