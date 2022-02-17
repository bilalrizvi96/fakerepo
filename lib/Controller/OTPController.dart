import 'dart:async';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OTPController extends GetxController {
  var code;
  var otptextcontroller = TextEditingController();
  Timer? _timer;
  var start = 30.obs;
  submit(verfication) {
    code = BaseUrl.storage.read("code");

    if (verfication == code) {
      Get.snackbar("OTP ", "OTP Verified Successfully");
      Get.offAllNamed("/signinemp");
    } else {
      otptextcontroller.clear();
      Get.snackbar("OTP ", "You enter the wrong OTP",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1500);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          update();
        } else {
          start.value--;
          update();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    _timer!.cancel();
    super.onClose();
  }
}
