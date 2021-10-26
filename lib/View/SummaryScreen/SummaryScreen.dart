import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Model/AttendanceChartModel.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<AttendanceChartModel> chart = [
    //   AttendanceChartModel(title: 'Present Days', value: 30),
    //   AttendanceChartModel(title: 'Absents Days', value: 12),
    //   AttendanceChartModel(title: 'Working Hours/wk', value: 40),
    // ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawers().drawers(context),
      body: SafeArea(
        child: Container(
            width: width,
            height: height,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 22.0, left: 22.0, top: 22.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      Text(
                        'Summary',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: width / 16),
                      ),
                      Spacer(),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            size: width / 13,
                            color: DynamicColor().primarycolor,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                DelayedDisplay(
                  fadeIn: true,
                  fadingDuration: Duration(milliseconds: 800),
                  child: GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2021, 3, 5),
                          maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/summarybg.png',
                            fit: BoxFit.contain,
                            width: width / 1.1,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 10,
                            ),
                            Text('Summary',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    fontSize: width / 21,
                                    color: DynamicColor().white)),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Image.asset(
                                'assets/summarycalendar.png',
                                height: height / 13,
                              ),
                            ),
                            SizedBox(
                              width: width / 10,
                            ),
                          ],
                        ),
                        Positioned(
                          top: height / 12,
                          left: width / 10,
                          right: width / 20,
                          child: Row(
                            children: [
                              Container(
                                height: height / 22,
                                width: width / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: DynamicColor()
                                        .primarycolor
                                        .withOpacity(0.40)),
                                child: Center(
                                  child: Text('24/5',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: width / 21,
                                          color: DynamicColor().white)),
                                ),
                              ),
                              SizedBox(
                                width: width / 20,
                              ),
                              Text('to',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      fontSize: width / 21,
                                      color: DynamicColor().white)),
                              SizedBox(
                                width: width / 20,
                              ),
                              Container(
                                height: height / 22,
                                width: width / 7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: DynamicColor()
                                        .primarycolor
                                        .withOpacity(0.40)),
                                child: Center(
                                  child: Text('24/5',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: width / 21,
                                          color: DynamicColor().white)),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (_, index) {
                        return DelayedDisplay(
                          fadeIn: true,
                          fadingDuration: Duration(milliseconds: 800),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 1.2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width / 80,
                                    height: height / 12,
                                    color: DynamicColor().primarycolor,
                                  ),
                                  SizedBox(
                                    width: width / 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Shift Type :',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w200,
                                                color: Colors.black
                                                    .withOpacity(0.77),
                                                fontSize: width / 25),
                                          ),
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Text('Morning',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 25)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height / 200,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Present Days :',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w200,
                                                color: Colors.black
                                                    .withOpacity(0.77),
                                                fontSize: width / 25),
                                          ),
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Text('30',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width / 23)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
