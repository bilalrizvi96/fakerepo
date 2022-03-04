import 'dart:async';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class OTPController extends GetxController {
  var code;
  var otptextcontroller = TextEditingController();
  Timer? _timer;
  var start = 30.obs;
  String _comingSms = 'Unknown';
  submit(verfication) async {
    code = BaseUrl.storage.read("code");

    if (verfication != null) {
      var response = await API().OTPVerification(
          code: verfication.toString(),
          empCode: BaseUrl.storage.read("empCode"));
      if (response.statusCode == 200) {
        Get.snackbar("OTP ", "OTP Verified Successfully");
        Get.offAllNamed("/signinemp");
      } else {
        otptextcontroller.clear();
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
    // else {
    //   Get.snackbar("OTP ", "You enter the wrong OTP",
    //       colorText: Colors.white, backgroundColor: Colors.red);
    // }
  }

  resendOtp() async {
    otptextcontroller.clear();
    start.value = 0;
    startTimer();
    update();
    var response = await API().ResendOTp();
    if (response.statusCode == 200) {
      Get.snackbar("OTP ", "OTP Send Successfully");
    } else {
      otptextcontroller.clear();
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> initSmsListener() async {
    String comingSms;
    try {
      comingSms = (await AltSmsAutofill().listenForSms)!;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    // if (!mounted) return;

    _comingSms = comingSms;
    print("====>Message: ${_comingSms}");
    print("${_comingSms[32]}");
    otptextcontroller.text = _comingSms[32] +
        _comingSms[33] +
        _comingSms[34] +
        _comingSms[35] +
        _comingSms[36] +
        _comingSms[
            37]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
  }

  @override
  void onInit() {
    super.onInit();
    initSmsListener();
    startTimer();
  }

  void startTimer() {
    var oneSec = const Duration(milliseconds: 1500);
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
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  void onClose() {
    _timer!.cancel();
    AltSmsAutofill().unregisterListener();
    super.onClose();
  }
}
