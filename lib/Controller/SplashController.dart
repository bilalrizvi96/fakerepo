import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
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
