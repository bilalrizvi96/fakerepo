import 'dart:async';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;
  var context;
  var connection = true.obs;

  check() async {
    await DataConnectionChecker().onStatusChange.listen((status) async {
      if (status == DataConnectionStatus.connected) {
        connection.value = true;
        checks();
        update();
      } else {
        connection.value = false;
        update();
      }
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    check();
  }

  // checkUpdate() async {
  //   var response = await API().CheckUpdate();
  //   if (response.statusCode == 200) {
  //     updates.value = response.data['response']['updateAvailability'];
  //     if (updates.value == true) {
  //       url.value = response.data['response']['link'];
  //       BaseUrl.url = url.value;
  //       // print(updateController.url);
  //     }
  //     checks();
  //   } else {
  //     Get.snackbar("Error ", response.data['error'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  // }

  checks() {
    var tokenval = BaseUrl.storage.read("token");
    BaseUrl.storage1.read('seen') ?? false;
    Future.delayed(new Duration(milliseconds: 500), () {
      if (tokenval != "out") {
        if (tokenval != null) {
          Get.offAllNamed('/home');
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed('/signinemp');
        } else {
          BaseUrl.storage1.write('seen', true);
          Get.offAllNamed('/intro');
        }
      } else if (BaseUrl.storage1.read('seen') == true) {
        Get.offAllNamed('/signinemp');
      } else {
        BaseUrl.storage1.write('seen', true);
        Get.offAllNamed('/intro');
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
