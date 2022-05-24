import 'package:attendencesystem/Model/MaintenanceModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class MaintenanceController extends GetxController {
  var message = ''.obs, time = 0.obs, is_maintenance = false.obs;
  var Loading = false.obs;
  List<MaintenanceModel> mainmodel = [];
  checkMaintenance() async {
    Loading.value = true;
    var response = await API().CheckMaintenance();
    if (response.statusCode == 200) {
      // BaseUrl.storage.write('token', 'out');

      message.value = response.data['data']['message'];
      time.value = response.data['data']['remainingTime'];
      is_maintenance.value = response.data['data']['underMaintenance'];
      BaseUrl.storage.write('message', message.value);
      BaseUrl.storage.write('time', time.value);
      Loading.value = false;
      update();
      if (is_maintenance.value == false) {
        Get.offAllNamed('/signinemp');
      } else if (is_maintenance.value == true) {
        BaseUrl.storage.write('token', 'out');
        Get.offAllNamed('/maintaince');
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
    super.onInit();
    // checkMaintenance();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
