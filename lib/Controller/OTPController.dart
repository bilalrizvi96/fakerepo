import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';

import 'package:get/get.dart';

class OTPController extends GetxController {
  var code;

  submit(int verfication) {
    code = BaseUrl().storage.read("code");

    if (verfication == code) {
      Get.snackbar("OTP ", "OTP Verified  Successfully");
      Get.offAllNamed("/facerule");
    } else {
      Get.snackbar("OTP ", "You enter the wrong OTP");
    }
  }
}
