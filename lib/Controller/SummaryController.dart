import 'package:attendencesystem/Model/WeekModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SummaryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // var fromdate =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
  //         .obs;
  var todate = DateTime(DateTime.now().year, DateTime.now().month).obs;
  var Loading = false.obs;
  TabController? tabController;
  var lastday = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  var weeklist = [].obs;
  var selectedmonths = ''.obs;
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

  init() // summary() async {
  //   var response = await API().Summary(
  //     end: int.parse(todate.value.day.toString()),
  //     // start: int.parse(fromdate.value.day.toString())
  //   );
  //
  //   if (response != null) {
  //     // summarylist.clear();
  //     if (response.statusCode == 200) {
  //       Loading.value = false;
  //       var data = response.data;
  //       // summarylist.add(SummaryModel(
  //       //   Absent_Days: data['Absent Days'].toString(),
  //       //   Hours_Short: data['Short Hours'].toString(),
  //       //   Over_Time: data['Over Time'].toString(),
  //       //   Present_Days: data['Present Days'].toString(),
  //       //   Shift_Type: data['Shift Type'].toString(),
  //       //   Working_Hours: data['Total Working Hours'].toString(),
  //       //   Hours: data['Hours'].toString(),
  //       //   Estimate_time: data['Estimated Time'].toString(),
  //       // ));
  //       //print(data);
  //     } else {
  //       Loading.value = false;
  //       Get.snackbar("Error ", response.data['error'].toString(),
  //           colorText: Colors.white, backgroundColor: Colors.red);
  //     }
  //     update();
  //   } else {
  //     Loading.value = false;
  //     Get.snackbar("Error ", response.data['error'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  // }
  {
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
    update();
  }

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    init();
    // summary();
    // update();
  }
}
