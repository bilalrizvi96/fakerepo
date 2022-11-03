import 'dart:io';

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
    check();
    profileData();
  }

  check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });
        // Loading.value = false;

      }
    } on SocketException catch (_) {
      connection.value = false;
      Loading.value = true;
      Future.delayed(new Duration(milliseconds: 2000), () {
        Loading.value = false;

        update();
      });
      update();
    }
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;

        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;
          update();
        });

        update();
      } else {
        connection.value = false;
        Loading.value = true;
        Future.delayed(new Duration(milliseconds: 2000), () {
          Loading.value = false;

          update();
        });
        update();
      }
    });
    update();
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
