import 'package:attendencesystem/API/BaseURl.dart';
import 'package:attendencesystem/Model/PointsModel.dart';
import 'package:attendencesystem/Model/SummaryAnalyticsModel.dart';
import 'package:attendencesystem/Model/SummaryGuidelineModel.dart';
import 'package:attendencesystem/Model/WeekModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../API/API.dart';
import '../Model/SummaryDetailsModel.dart';

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

  // var pointlist = [
  //   PointsModel(
  //       Title: 'Registration',
  //       color: Color(0xFFFFF6C2),
  //       textcolor: Color(0xFFB66B2A),
  //       decription: 'Get 10 points on registration',
  //       point: '+10'),
  //   PointsModel(
  //       Title: 'Weekly Hours',
  //       color: Color(0xFFFFF6C2),
  //       textcolor: Color(0xFFB66B2A),
  //       decription: 'Complete your weekly hours'
  //           ' target and get reward point,',
  //       point: '+10'),
  //   PointsModel(
  //       Title: 'No Absent',
  //       color: Color(0xFFFFF6C2),
  //       textcolor: Color(0xFFB66B2A),
  //       decription: 'When you complete a month without'
  //           ' any absent then you will get a point.',
  //       point: '+10'),
  //   PointsModel(
  //       Title: 'Overtime',
  //       color: Color(0xFFFFF6C2),
  //       textcolor: Color(0xFFB66B2A),
  //       decription: 'Hurray! Get rewards when ever you'
  //           ' complete a day with extra hours.',
  //       point: '+10'),
  //   PointsModel(
  //       Title: 'Target Not Achieved',
  //       color: Color(0xFFE61756),
  //       textcolor: Colors.white.withOpacity(0.80),
  //       decription: 'If somehow you missed to win the'
  //           ' weekly target then there will be a'
  //           ' deduction.',
  //       point: '-10'),
  //   PointsModel(
  //       Title: 'Absent Day',
  //       color: Color(0xFFE61756),
  //       textcolor: Colors.white.withOpacity(0.80),
  //       decription: 'Absents other than sick leave will mark'
  //           ' a deduction.',
  //       point: '-10'),
  // ];
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
      // Get.snackbar("Error ", response.data['message'].toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    update();
  }

  summaryDetails() async {
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
    summaryGuideline();
    init();
  }
}
