import 'package:attendencesystem/Model/SummaryAnalyticsModel.dart';
import 'package:attendencesystem/Model/WeekModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../API/API.dart';

class SummaryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var todate = DateTime(DateTime.now().year, DateTime.now().month).obs;
  var Loading = false.obs;
  TabController? tabController;
  var lastday = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  var weeklist = [].obs;
  var selectedmonths = ''.obs;
  var summarydata = [].obs;
  var message = ''.obs;
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  toDate(date) {
    todate.value = date;
    if (todate.value == date) {
      Loading.value = true;
      print(todate.value);
      weeklist.value = [
        WeekModel(range: '1 - 7', selected: true),
        WeekModel(range: '8 - 14', selected: false),
        WeekModel(range: '15 - 21', selected: false),
        WeekModel(
            range:
                '21 - ${DateTime(todate.value.year, todate.value.month + 1, 0).day}',
            selected: false),
      ];
      selectedmonths.value =
          months[todate.value.month - 1] + "-" + todate.value.year.toString();
      // summary();
      summaryAnalytics();
    }
    update();
  }

  weekSelection(index) {
    for (int i = 0; i < weeklist.value.length; i++) {
      if (i == index) {
        if (weeklist.value[i].selected == true) {
          // weeklist.value[i].selected = false;

        } else {
          weeklist.value[i].selected = true;
        }
      } else {
        weeklist.value[i].selected = false;
      }
    }
    update();
  }

  summaryAnalytics() async {
    var response = await API().Summaryanalytic(
        month: todate.value.month.toString(),
        year: todate.value.year.toString());
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SummaryAnalytics.fromJson(response.data);
      message.value = response.data.messages.message;
      summarydata.value = response;
      print(message.value);
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  init() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    weeklist.value = [
      WeekModel(range: '1 - 7', selected: true),
      WeekModel(range: '8 - 14', selected: false),
      WeekModel(range: '15 - 21', selected: false),
      WeekModel(
          range:
              '21 - ${DateTime(todate.value.year, todate.value.month + 1, 0).day}',
          selected: false),
    ];
    selectedmonths.value =
        months[todate.value.month - 1] + "-" + todate.value.year.toString();
    print(selectedmonths.value);
    summaryAnalytics();
    update();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   tabController!.dispose();
  // }

  @override
  void onInit() {
    super.onInit();
    init();
    // summary();
    // update();
  }
}
