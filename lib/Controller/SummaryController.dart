import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/Model/SummaryModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SummaryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var fromdate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var todate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;
  var Loading = false.obs;
  TabController? tabController;
  List<SummaryModel> summarylist = [];
  fromDate(date) {
    fromdate.value = date;
    if (fromdate.value == date) {
      Loading.value = true;
      summary();
    }
    update();
  }

  toDate(date) {
    todate.value = date;
    if (todate.value == date) {
      Loading.value = true;
      summary();
    }
    update();
  }

  summary() async {
    var response = await API().Summary(
        end: int.parse(todate.value.day.toString()),
        start: int.parse(fromdate.value.day.toString()));

    if (response != null) {
      summarylist.clear();
      if (response.statusCode == 200) {
        Loading.value = false;
        var data = response.data;
        summarylist.add(SummaryModel(
          Absent_Days: data['Absent Days'].toString(),
          Hours_Short: data['Short Hours'].toString(),
          Over_Time: data['Over Time'].toString(),
          Present_Days: data['Present Days'].toString(),
          Shift_Type: data['Shift Type'].toString(),
          Working_Hours: data['Total Working Hours'].toString(),
          Hours: data['Hours'].toString(),
          Estimate_time: data['Estimated Time'].toString(),
        ));
        //print(data);
      } else {
        Loading.value = false;
        Get.snackbar("Error ", response.data['error'].toString(),
            colorText: Colors.white, backgroundColor: Colors.red);
      }
      update();
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    Loading.value = false;
    // summary();
    update();
    super.onInit();
  }
}
