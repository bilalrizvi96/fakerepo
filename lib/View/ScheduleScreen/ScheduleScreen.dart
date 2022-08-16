import 'package:attendencesystem/Controller/ScheduleController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../Model/CalendarModel.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);
  ScheduleController _scheduleControllerontroller =
      Get.put(ScheduleController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        child: GetBuilder(
            init: _scheduleControllerontroller,
            builder: (_) {
              return _scheduleControllerontroller.holidayslist.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.grey[600])),
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                'My Job Schedule',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width / 16),
                              ),
                              SizedBox(
                                width: width / 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(int.parse("0xFF" +
                                        _scheduleControllerontroller
                                            .off.value)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text('Off'),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(int.parse("0xFF" +
                                        _scheduleControllerontroller
                                            .evening.value)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text('Evening'),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(int.parse("0xFF" +
                                        _scheduleControllerontroller
                                            .morning.value)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text('Morning'),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(int.parse("0xFF" +
                                        _scheduleControllerontroller
                                            .nigth.value)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text('Night'),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Color(int.parse("0xFF" +
                                        _scheduleControllerontroller
                                            .holiday.value)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              ),
                              SizedBox(
                                width: width / 40,
                              ),
                              Text('Holiday'),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          Container(
                            height: height / 1.5,
                            child: SfCalendar(
                              view: CalendarView.month,
                              dataSource: MeetingDataSource(
                                  _scheduleControllerontroller.getDataSource()),
                              maxDate: DateTime(
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.last.date
                                        .toString()
                                        .split('-')[2])
                                    : 30,
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.last.date
                                        .toString()
                                        .split('-')[1])
                                    : 30,
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.last.date
                                        .toString()
                                        .split('-')[0])
                                    : 30,
                              ),
                              minDate: DateTime(
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.first.date
                                        .toString()
                                        .split('-')[2])
                                    : 0,
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.first.date
                                        .toString()
                                        .split('-')[1])
                                    : 0,
                                _scheduleControllerontroller
                                        .holidayslist.isNotEmpty
                                    ? int.parse(_scheduleControllerontroller
                                        .holidayslist.value.first.date
                                        .toString()
                                        .split('-')[0])
                                    : 0,
                              ),
                              monthViewSettings: MonthViewSettings(
                                  agendaItemHeight:
                                      MediaQuery.of(context).size.height,
                                  // showTrailingAndLeadingDates: true,
                                  // appointmentDisplayCount: 2,
                                  appointmentDisplayMode:
                                      MonthAppointmentDisplayMode.appointment),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        "assets/1.gif",
                        height: 200,
                        width: 200,
                      ),
                    );
            }),
      ),
    );
  }
}
