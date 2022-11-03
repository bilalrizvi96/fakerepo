import 'dart:io';

import 'package:attendencesystem/Model/MaintenanceModel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';
import '../Routes/Routes.dart';

class MaintenanceController extends GetxController {
  var message = ''.obs, time = 0.obs, is_maintenance = false.obs;
  var Loading = false.obs;
  var connection = true.obs;
  List<MaintenanceModel> mainmodel = [];
  @override
  void onInit() {
    super.onInit();
    checkMaintenance();
  }

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;
        update();
      }
    } on SocketException catch (_) {
      connection.value = false;
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        Loading.value = false;
        connection.value = true;

        update();
      } else {
        Loading.value = false;
        connection.value = false;
        update();
      }
    });
  }

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
        Get.offAllNamed(Routes.signinemp);
      } else if (is_maintenance.value == true) {
        // BaseUrl.storage.write('token', 'out');
        // Get.offAllNamed(Routes.maintaince);
      }
    } else {
      Loading.value = false;
      Get.snackbar("Maintenance ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // this.dispose();
  }
}
