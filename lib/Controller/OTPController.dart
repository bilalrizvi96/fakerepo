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
  submit() async {
    code = BaseUrl.storage.read("code");

    if (otptextcontroller.text.isNotEmpty) {
      var response = await API().OTPVerification(
          code: otptextcontroller.text.toString(),
          empCode: BaseUrl.storage.read("empCode"));
      if (response.statusCode == 200) {
        // Get.snackbar("OTP ", response.data['response'].toString());
        Get.offAllNamed("/signinemp");
      } else {
        otptextcontroller.clear();
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
  }

  resendOtp() async {
    otptextcontroller.clear();

    var response = await API().ResendOTp();
    if (response.statusCode == 200) {
      Get.snackbar("OTP ", "OTP Send Successfully");
      start.value = 30;
      startTimer();
    } else {
      otptextcontroller.clear();
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
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
        _comingSms[37];
  }

  @override
  void onInit() {
    resendOtp();
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
