import 'package:attendencesystem/Component/DynamicColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'API/BaseURl.dart';
import 'Controller/SummaryController.dart';

class Summarynew extends StatelessWidget {
  Summarynew({Key? key}) : super(key: key);
  SummaryController summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 22.0,
              left: 22.0,
            ),
            child: GetBuilder(
                init: summaryController,
                builder: (_) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 20,
                            ),
                            Text(
                              'Summary',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: width / 16),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                BaseUrl.storage.write("token", "out");
                                Get.offAllNamed('/signinemp');
                              },
                              child: Icon(
                                Icons.logout,
                                size: width / 16,
                                color: Color(0xFFEC4A22),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width / 30,
                            ),
                            Container(
                              height: height / 19,
                              width: width / 2.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.topRight,
                                    colors: DynamicColor().gradient),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        -2, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Image.network(
                                    'https://attandence-bucket.s3.us-east-2.amazonaws.com/attandenceAppAssests/summarycalendar.png',
                                    height: height / 25,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Summary',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 30),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Spacer(),

                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  width: width / 8,
                                  height: height / 19,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFEC4A22)),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0))),
                                  child: Icon(
                                    Icons.stars_rounded,
                                    color: Color(0xFFEC4A22),
                                  ),
                                ),
                                Container(
                                  width: width / 8,
                                  height: height / 19,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFEC4A22)),
                                    color: Color(0xFFEC4A22),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0)),
                                  ),
                                  child: Text(
                                    '10',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: width / 24),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                // BaseUrl.storage.write("token", "out");
                                // Get.offAllNamed('/signinemp');
                              },
                              child: Icon(
                                Icons.info_outline_rounded,
                                size: width / 15,
                                color: Color(0xFFEC4A22),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Container(
                          height: height / 10,
                          child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 5.0,
                                    left: 5.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Week " + '${index + 1}',
                                        style: GoogleFonts.poppins(
                                            color:
                                                Colors.black.withOpacity(0.50),
                                            fontWeight: FontWeight.w500,
                                            fontSize: width / 32),
                                      ),
                                      SizedBox(
                                        height: height / 50,
                                      ),
                                      Container(
                                        width: width / 5.5,
                                        height: height / 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.topRight,
                                              colors: DynamicColor().gradient),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          // border: Border.all(
                                          //     color: Colors.black)
                                        ),
                                        child: Text(
                                          '1 - 7',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: Colors.white,
                                              fontSize: width / 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Container(
                          height: height / 18,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: TabBar(
                            controller: summaryController.tabController,
                            // give the indicator a decoration (color and border radius)
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.topRight,
                                  colors: DynamicColor().gradient),
                            ),
                            labelColor: Colors.white,

                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold),
                            unselectedLabelColor: DynamicColor().titletextcolor,

                            tabs: [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                text: "Analytics",
                              ),

                              // second tab [you can add an icon using the icon property]
                              Tab(
                                text: 'Details',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width,
                          height: height * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.20)),
                          ),
                          padding: EdgeInsets.all(3.0),
                          child: TabBarView(
                            controller: summaryController.tabController,
                            children: [
                              Analytics(width: width, height: height),
                              Text(
                                '1 - 7',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: width / 24),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class Analytics extends StatelessWidget {
  const Analytics({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 50,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: width / 1.5,
                  height: height / 5,
                  padding: EdgeInsets.only(left: 70, right: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F9FF),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Transform.rotate(
                          angle: 9.4,
                          child: Text(
                            ',,',
                            maxLines: 4,
                            style: GoogleFonts.poppins(
                                color: Color(0XFFBACADC),
                                fontWeight: FontWeight.w500,
                                fontSize: width / 7),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'For every single dark'
                          " night there is a"
                          '  brighter day.',
                          maxLines: 4,
                          style: GoogleFonts.poppins(
                              color: Color(0XFF1B236B),
                              fontWeight: FontWeight.w500,
                              fontSize: width / 25),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          ',,',
                          maxLines: 4,
                          style: GoogleFonts.poppins(
                              color: Color(0XFFBACADC),
                              fontWeight: FontWeight.w500,
                              fontSize: width / 7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: width / 3.5,
                    height: height / 6.5,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFA45200),
                            spreadRadius: -12.0,
                            blurRadius: 12.0,
                          ),
                        ],
                        color: Color(0xFFFFF9DF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 50,
                        ),
                        Image.asset(
                          'assets/sun.png',
                          fit: BoxFit.contain,
                          width: width / 8,
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                        Text(
                          'Shift',
                          style: GoogleFonts.poppins(
                              color: Color(0XFFFE7F00),
                              fontWeight: FontWeight.w500,
                              fontSize: width / 28),
                        ),
                        Text(
                          'Morning',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFFE7F00),
                              fontStyle: FontStyle.italic,
                              fontSize: width / 28),
                        ),
                        SizedBox(
                          height: height / 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 50,
          ),
          Row(
            children: [
              Container(
                width: width / 3.7,
                height: height / 7,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 12,
                      startAngle: width / 1.5,
                      endAngle: width / 1.5,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.6,
                      axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothFlat,
                          color: Color(0xFFCFE4FE),
                          thickness: width / 45),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 2,
                            cornerStyle: CornerStyle.bothFlat,
                            width: width / 45,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: DynamicColor().primarycolor,
                            gradient: SweepGradient(colors: <Color>[
                              DynamicColor().primarycolor,
                              DynamicColor().primarycolor
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                            value: 2,
                            enableDragging: true,
                            //onValueChanged: onVolumeChanged,
                            markerHeight: 20,
                            markerWidth: 20,
                            markerType: MarkerType.image,
                            color: Color(0XFFFFAB40),
                            borderWidth: 2,
                            borderColor: Color(0XFFFFAB40))
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            axisValue: 5,
                            positionFactor: 0.1,
                            widget: Text(2.ceil().toString() + '/12',
                                style: TextStyle(
                                    fontSize: width / 30,
                                    fontWeight: FontWeight.bold,
                                    color: DynamicColor().primarycolor))),
                        GaugeAnnotation(
                          angle: 90,
                          axisValue: 5,
                          positionFactor: 1.2,
                          widget: Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, bottom: 5),
                            child: Text('Annual Leave',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color: DynamicColor().primarycolor,
                                    fontSize: width / 36)),
                          ),
                        )
                      ])
                ]),
              ),
              Container(
                width: width / 3.7,
                height: height / 7,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 12,
                      startAngle: width / 1.5,
                      endAngle: width / 1.5,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.6,
                      axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothFlat,
                          color: Color(0xFFCFE4FE),
                          thickness: width / 45),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 2,
                            cornerStyle: CornerStyle.bothFlat,
                            width: width / 45,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: DynamicColor().primarycolor,
                            gradient: SweepGradient(colors: <Color>[
                              Color(0xFFEC4A22),
                              Color(0xFFEC4A22)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                            value: 2,
                            enableDragging: true,
                            //onValueChanged: onVolumeChanged,
                            markerHeight: 20,
                            markerWidth: 20,
                            markerType: MarkerType.image,
                            color: Color(0XFFFFAB40),
                            borderWidth: 2,
                            borderColor: Color(0XFFFFAB40))
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            axisValue: 5,
                            positionFactor: 0.1,
                            widget: Text(2.ceil().toString() + '/12',
                                style: TextStyle(
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFEC4A22)))),
                        GaugeAnnotation(
                          angle: 90,
                          axisValue: 5,
                          positionFactor: 1.2,
                          widget: Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 5),
                              child: Text('Sick Leave',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                      color: Colors.red,
                                      fontSize: width / 36))),
                        )
                      ])
                ]),
              ),
              Container(
                width: width / 3.7,
                height: height / 7,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 12,
                      startAngle: width / 1.5,
                      endAngle: width / 1.5,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.6,
                      axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothFlat,
                          color: Color(0xFFCFE4FE),
                          thickness: width / 45),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 2,
                            cornerStyle: CornerStyle.bothFlat,
                            width: width / 45,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: DynamicColor().primarycolor,
                            gradient: SweepGradient(colors: <Color>[
                              Colors.deepPurple,
                              Colors.deepPurple,
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                            value: 2,
                            enableDragging: true,
                            //onValueChanged: onVolumeChanged,
                            markerHeight: 20,
                            markerWidth: 20,
                            markerType: MarkerType.image,
                            color: Color(0XFFFFAB40),
                            borderWidth: 2,
                            borderColor: Color(0XFFFFAB40))
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            axisValue: 5,
                            positionFactor: 0.1,
                            widget: Text(2.ceil().toString() + '/12',
                                style: TextStyle(
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple))),
                        GaugeAnnotation(
                          angle: 90,
                          axisValue: 5,
                          positionFactor: 1.2,
                          widget: Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 5),
                              child: Text('Causal Leave',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                      color: Colors.deepPurple,
                                      fontSize: width / 36))),
                        )
                      ])
                ]),
              ),
            ],
          ),
          SizedBox(
            height: height / 80,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCDDBFA)),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Presents',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFE7EEFE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: DynamicColor().primarycolor,
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFE7EEFE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: DynamicColor().primarycolor,
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFCDDBFA)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Absents',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFFEF5E4)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDC3810),
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFFEF5E4)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDC3810),
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCDDBFA)),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Target',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFF0FEE4)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6D8459),
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFF0FEE4)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6D8459),
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 50,
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCDDBFA)),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Work Hours',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFFBE4FE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFA24AAE),
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFFBE4FE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFA24AAE),
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFCDDBFA)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Short Hours',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFEBE4FE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAE1CE4),
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFEBE4FE)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAE1CE4),
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width / 3.7,
                  height: height / 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCDDBFA)),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Over Time',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Month',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFE7FEEB)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1AC137),
                              fontSize: width / 27),
                        ),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        'Week',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: width / 27),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0XFFE7FEEB)),
                        child: Text(
                          '5',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1AC137),
                              fontSize: width / 27),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
