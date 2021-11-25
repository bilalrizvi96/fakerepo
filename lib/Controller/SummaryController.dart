import 'dart:io';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SummaryController extends GetxController {
  var fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var todate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;

  fromDate(date) {
    fromdate.value = date;
    update();
  }

  toDate(date) {
    todate.value = date;
    if (todate.value == date) {
      summary();
    }

    update();
  }

  summary() async {
    var response = await API().Summary(
        end: todate.value.day.toString(), start: fromdate.value.day.toString());
    if (response != null) {
      if (response.length != 0) {
        var data = response;
        print(data);
        Get.snackbar("Summary ", "Summary Generated");
        // Get.offAllNamed('/home');
      } else {
        Get.snackbar("Summary ", response.toString());
      }
    } else {
      Get.snackbar("Summary ", response.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
