import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/PointsModel.dart';
import 'package:attendencesystem/Model/SummaryAnalyticsModel.dart';
import 'package:attendencesystem/Model/SummaryGuidelineModel.dart';
import 'package:attendencesystem/Model/WeekModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API/API.dart';
import '../Model/SummaryDetailsModel.dart';
import 'SignInEmployeeController.dart';

class SummaryController extends GetxController
    with GetTickerProviderStateMixin {
  var todate = DateTime(DateTime.now().year, DateTime.now().month).obs;
  var Loading = false.obs;
  TabController? tabController;
  var lastday = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  var weeklist = [].obs;
  var selectedmonths = ''.obs;
  var summarydata = [].obs;
  var summaryguidelinelist = [].obs;
  var summarydetaildata = [].obs;

  var weekupdate = 0.obs;
  var tabindex = 0.obs;
  var day, month, year;
  var mindate;

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
  summaryPdf() async {
    Loading.value = true;
    var response = await API().SummaryPDf(
        month: todate.value.month.toString(),
        year: todate.value.year.toString());
    if (response.statusCode == 200) {
      var urls = response.data['data'][0]['url'];
      Loading.value = false;
      print(urls);
      if (!await launch(
        urls,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )) {
        throw 'Could not launch $urls';
      }
    } else {
      Loading.value = false;
      Get.snackbar("Error ", response.data['error'].toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  toDate(date) {
    todate.value = date;
    if (todate.value == date) {
      Loading.value = true;
      selectedmonths.value =
          months[todate.value.month - 1] + "-" + todate.value.year.toString();
      summaryAnalytics();
      summaryDetails();
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
    print('arsalan');
    Loading.value = true;
    weekupdate.value = 0;
    weeklist.value.clear();
    summarydata.value.clear();
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
          selected: false,
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
                '22 - ${DateTime(todate.value.year, todate.value.month + 1, 0).day}',
            weekdata: summarydata.value[0].fourthWeek,
            selected: false),
      ];
      if (DateTime.now().day < 8) {
        weeklist.value[0].selected = true;
        weekupdate.value = 0;
      } else if (DateTime.now().day < 15) {
        weeklist.value[1].selected = true;
        weekupdate.value = 1;
      } else if (DateTime.now().day < 22) {
        weeklist.value[2].selected = true;
        weekupdate.value = 2;
      } else {
        weeklist.value[3].selected = true;
        weekupdate.value = 3;
      }
      BaseUrl.storage.write('points', summarydata.value[0].points);
    } else {
      Loading.value = false;

      print(response.statusCode.toString());
      print("response.statusCode.toString()");
      update();
    }
    update();
  }

  summaryDetails() async {
    print('arsalan');
    Loading.value = true;
    summarydetaildata.value.clear();
    var response = await API().Summarydetail(
        start: '1' +
            '/' +
            todate.value.month.toString() +
            '/' +
            todate.value.year.toString(),
        end:
            '${todate.value.month == DateTime.now().month ? DateTime.now().day : DateTime(todate.value.year, todate.value.month + 1, 0).day}' +
                '/' +
                todate.value.month.toString() +
                '/' +
                todate.value.year.toString());
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SummaryDetailsModel.fromJson(response.data);
      summarydetaildata.value = response.dailyDetails;

      if (todate.value.month == int.parse(month)) {
        summarydetaildata.value.removeWhere((item) =>
            int.parse(item.mobileDate.toString().split('-')[0]) <
            int.parse(day));
      }
    } else {
      Loading.value = false;
      // Get.snackbar("Error ", response.data['message'].toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  summaryGuideline() async {
    summaryguidelinelist.value.clear();
    var response = await API().SummaryGuideline();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = await SummaryGuidelineModel.fromJson(response.data);
      summaryguidelinelist.value = response.data;

      print(summaryguidelinelist.value[0].decription);
    } else {
      Loading.value = false;
    }
    update();
  }

  init() {
    summaryguidelinelist.value.clear();
    tabController =
        TabController(length: 2, vsync: this, initialIndex: tabindex.value)
          ..addListener(() {
            tabindex.value = tabController!.index;
            update();
          });

    selectedmonths.value =
        months[todate.value.month - 1] + "-" + todate.value.year.toString();
    print(selectedmonths.value);
    day = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[0];
    month = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[1];
    year = BaseUrl.storage.read("firstAttendanceRecordDate").split('/')[2];
    mindate = DateFormat('dd-MM-y').parse(day + '-' + month + '-' + year);
    summaryAnalytics();
    summaryDetails();
    print(BaseUrl.storage.read("summaryguideline"));
    if (summaryguidelinelist.isEmpty) {
      summaryGuideline();
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }
}
