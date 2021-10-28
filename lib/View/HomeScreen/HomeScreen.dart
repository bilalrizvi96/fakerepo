import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:attendencesystem/Component/SideDrawer.dart';
import 'package:attendencesystem/Model/AttendanceChartModel.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AttendanceChartModel> chart = [
      AttendanceChartModel(title: 'Present Days', value: 30),
      AttendanceChartModel(title: 'Absents Days', value: 12),
      AttendanceChartModel(title: 'Working Hours/wk', value: 40),
    ];
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
                        'Dashboard',
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
                Row(
                  children: [
                    Container(
                        width: width / 1.8,
                        child: SfCircularChart(
                            // title: ChartTitle(text: "Summary"),
                            palette: [
                              Color.fromRGBO(47, 50, 203, 1.0),
                              Color.fromRGBO(186, 40, 83, 1.0),
                              Color.fromRGBO(23, 135, 79, 1.0),
                            ],
                            legend: Legend(
                              image: AssetImage('assets/per.jpg'),
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),

                            // backgroundImage: AssetImage('assets/per.jpg'),
                            series: <CircularSeries>[
                              // Renders radial bar chart
                              RadialBarSeries<AttendanceChartModel, String>(
                                  gap: "6",
                                  cornerStyle: CornerStyle.endCurve,
                                  opacity: 0.75,
                                  enableTooltip: true,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      labelIntersectAction:
                                          LabelIntersectAction.shift),
                                  innerRadius: '40%',
                                  dataSource: chart,
                                  maximumValue: 40,
                                  xValueMapper:
                                      (AttendanceChartModel data, _) =>
                                          data.title,
                                  yValueMapper:
                                      (AttendanceChartModel data, _) =>
                                          data.value)
                            ])),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Color.fromRGBO(47, 50, 203, 1.0),
                            ),
                            Text(' Present Day')
                          ],
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Color.fromRGBO(186, 40, 83, 1.0),
                            ),
                            SizedBox(
                              width: width / 60,
                            ),
                            Text('Absents Days')
                          ],
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Color.fromRGBO(23, 135, 79, 1.0),
                            ),
                            SizedBox(
                              width: width / 60,
                            ),
                            Text('Present Day')
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height / 500,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
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
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Shift Type :',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      color: Colors.black.withOpacity(0.77),
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
                                      color: Colors.black.withOpacity(0.77),
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
                Spacer(),
                Stack(
                  children: [
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 400),
                      child: Container(
                        height: height / 3.5,
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0)),
                            color: DynamicColor().primarycolor),
                      ),
                    ),
                    Positioned(
                      top: height / 20,
                      right: width / 12,
                      left: width / 12,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/attendance');
                        },
                        child: Image.asset(
                          'assets/qrdashboard.png',
                          height: height / 5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 30,
                      right: width / 12,
                      left: width / 12,
                      child: DelayedDisplay(
                        fadeIn: true,
                        fadingDuration: Duration(milliseconds: 800),
                        child: GestureDetector(
                          onTap: () {
                            // Get.offNamed('/faceverfication');
                          },
                          child: Center(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Punch your Attendance',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 20,
                                    color:
                                        DynamicColor().white.withOpacity(0.44)),
                              ),
                              SizedBox(
                                height: height / 8,
                              ),
                              Text(
                                'Scan QR code',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: width / 20,
                                    color: DynamicColor().white),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
