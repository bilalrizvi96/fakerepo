import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class MaintenanceController extends GetxController {
  var message, time, is_maintenance;
  var Loading = false.obs;
  checkMaintenance() async {
    Loading.value = true;
    var response = await API().CheckMaintenance();
    if (response.statusCode == 200) {
      message = response.data['data']['message'];
      time = response.data['data']['remainingTime'];
      is_maintenance = response.data['data']['underMaintenance'];
      Loading.value = false;
      if (is_maintenance == false) {
        BaseUrl.storage.write('maintenance', false);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onInit() {
    checkMaintenance();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
