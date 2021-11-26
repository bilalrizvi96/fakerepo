import 'dart:io';

import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/SummaryModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SummaryController extends GetxController {
  var fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var todate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  List<SummaryModel> summarylist = [];
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
      summarylist.clear();
      if (response.statusCode == 200) {
        var data = response.data;
        summarylist.add(SummaryModel(
            Absent_Days: data['Absent Days'].toString(),
            Hours_Short: data['Hours Short'].toString(),
            Over_Time: data['Over Time'].toString(),
            Present_Days: data['Present Days'].toString(),
            Shift_Type: data['Shift Type'].toString(),
            Working_Hours: data['Working Hours'].toString()));
        print(data);
        Get.snackbar("Summary ", "Summary Generated");
      }
      update();
    } else {
      Get.snackbar("Summary ", response.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
