import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  var updates = false.obs;
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
      if (tokenval != "out") {
        if (tokenval != null) {
          Get.offAllNamed('/home');
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed('/signinemp');
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

  checkUpdate() async {
    var response = await API().CheckUpdate();
    if (response.statusCode == 200) {
      updates.value = response.data['updateAvailability'];
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
