import 'package:attendencesystem/API/Capitalize.dart';
import 'package:attendencesystem/Model/HolidayModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../API/API.dart';
import '../API/BaseURl.dart';
import '../Model/CalendarModel.dart';

class ScheduleController extends GetxController {
  var holidayslist = [].obs;
  var Loading = false.obs;
  var morning = ''.obs;
  var evening = ''.obs;
  var nigth = ''.obs;
  var off = ''.obs;
  var holiday = ''.obs;
  List<Meeting> getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    if (holidayslist.isNotEmpty) {
      for (var val in holidayslist) {
        print(val.title);
        meetings.add(Meeting(
            startTime: DateTime(
                int.parse(val.date.toString().split('-')[2]),
                int.parse(val.date.toString().split('-')[1]),
                int.parse(val.date.toString().split('-')[0]),
                9),
            endTime: DateTime(
                int.parse(val.date.toString().split('-')[2]),
                int.parse(val.date.toString().split('-')[1]),
                int.parse(val.date.toString().split('-')[0]),
                10),
            isAllDay: true,
            // subject: val.title.toString().toTitleCase(),
            color: Color(int.parse("0xFF" + val.color))));
      }

      // meetings.add(Meeting(
      //   background: Color(int.parse("0xFF" + val.background.toString())),
      //   from: DateTime.parse(val.date.toString().split('-')[2] +
      //       "-" +
      //       val.date.toString().split('-')[1] +
      //       "-" +
      //       val.date.toString().split('-')[0] +
      //       'T00:00:00'),
      // ));
    } else {
      getHolidays();
    }

    print(meetings);
    return meetings;
  }

  getHolidays() async {
    Loading.value = true;
    update();
    holidayslist.value.clear();
    var response = await API().Holidays();
    if (response.statusCode == 200) {
      Loading.value = false;
      response = HolidayModel.fromJson(response.data);
      morning.value = response.data.colors.morning;
      evening.value = response.data.colors.evening;
      off.value = response.data.colors.off;
      nigth.value = response.data.colors.night;
      holiday.value = response.data.colors.holidays;

      holidayslist.value = response.data.dates;
      getDataSource();
    } else {
      Loading.value = false;
      print(response.data['error'].toString());
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
