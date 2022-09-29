import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';

class ProfileController extends GetxController {
  var Loading = false.obs;
  var connection = true.obs;
  @override
  void onInit() {
    super.onInit();
    profileData();
    check();
  }

  check() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        Loading.value = false;
        connection.value = true;
        update();
      } else {
        connection.value = false;
        update();
      }
    });
  }

  profileData() async {
    Loading.value = true;
    var response = await API().ProfileData();
    if (response.statusCode == 200) {
      // BaseUrl.storage.write('token', 'out');\
      BaseUrl.storage.write("region", response.data['data'][0]['shift_type']);
      BaseUrl.storage
          .write("starttime", response.data['data'][0]['start_timing']);
      BaseUrl.storage
          .write("endTiming", response.data['data'][0]['end_timing']);
      BaseUrl.storage
          .write("hoursPerWeek", response.data['data'][0]['hours_per_week']);
      BaseUrl.storage.write("phoneNo", response.data['data'][0]['PhoneNo']);
      BaseUrl.storage.write("eMail", response.data['data'][0]['EMail']);
      BaseUrl.storage.write("address", response.data['data'][0]['address']);
      BaseUrl.storage
          .write("designation", response.data['data'][0]['designation']);
      BaseUrl.storage
          .write("shiftTiming", response.data['data'][0]['shift_type']);
      Loading.value = false;
      update();
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['error'].toString(),
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
