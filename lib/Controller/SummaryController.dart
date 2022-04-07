import 'package:attendencesystem/Model/SummaryAnalyticsModel.dart';
import 'package:attendencesystem/Model/WeekModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../API/API.dart';
import '../Model/SummaryDetailsModel.dart';

class SummaryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var todate = DateTime(DateTime.now().year, DateTime.now().month).obs;
  var Loading = false.obs;
  TabController? tabController;
  var lastday = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  var weeklist = [].obs;
  var selectedmonths = ''.obs;
  var summarydata = [].obs;
  var summarydetaildata = [].obs;
  var weekupdate = 0.obs;
  // var message = ''.obs;
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
          weekupdate.value = i;
        }
      } else {
        weeklist.value[i].selected = false;
      }
    }
    update();
  }

  summaryAnalytics() async {
    weekupdate.value = 0;
    var response = await API().Summaryanalytic(
        month: todate.value.month.toString(),
        year: todate.value.year.toString());
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SummaryAnalyticsModel.fromJson(response.data);
      summarydata.value = response.data;
      weeklist.value = [
        WeekModel(
          range: '1 - 7',
          selected: true,
          weekdata: summarydata.value[0].firstWeek,
        ),
        WeekModel(
            range: '8 - 14',
            selected: false,
            weekdata: summarydata.value[0].secondWeek),
        WeekModel(
            range: '15 - 21',
            selected: false,
            weekdata: summarydata.value[0].thirdWeek),
        WeekModel(
            range:
                '21 - ${DateTime(todate.value.year, todate.value.month + 1, 0).day}',
            weekdata: summarydata.value[0].fourthWeek,
            selected: false),
      ];
      summaryDetails();
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  summaryDetails() async {
    var response = await API().Summarydetail(
        start: '1' +
            '/' +
            todate.value.month.toString() +
            '/' +
            todate.value.year.toString(),
        end: '${DateTime(todate.value.year, todate.value.month + 1, 0).day}' +
            '/' +
            todate.value.month.toString() +
            '/' +
            todate.value.year.toString());
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SummaryDetailsModel.fromJson(response.data);

      summarydetaildata.value = response.dailyDetails;
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['message'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  init() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);

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
