import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../Component/DynamicColor.dart';
import '../../Component/ErrorLoading.dart';
import '../../Controller/SummaryController.dart';

class Analytics extends StatelessWidget {
  Analytics({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  SummaryController _summaryController = Get.put(SummaryController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5.0,
        left: 8.0,
      ),
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: GetBuilder(
              init: _summaryController,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    if (_summaryController.weeklist.value.isNotEmpty)
                      _summaryController
                                  .weeklist
                                  .value[_summaryController.weekupdate.value]
                                  .weekdata[0]
                                  .message ==
                              'Data found with alert'
                          ? DelayedDisplay(
                              fadeIn: true,
                              child: Container(
                                width: width / 1.2,
                                height: height / 5,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: 30, right: 22.0, left: 25.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: NetworkImage(_summaryController
                                            .weeklist
                                            .value[_summaryController
                                                .weekupdate.value]
                                            .weekdata[0]
                                            .alert
                                            .imageUrl),
                                        fit: BoxFit.cover)),
                                child: Text(
                                  _summaryController
                                      .weeklist
                                      .value[
                                          _summaryController.weekupdate.value]
                                      .weekdata[0]
                                      .alert
                                      .message,
                                  textAlign: TextAlign.center,
                                  maxLines: 4,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width / 27),
                                ),
                              ),
                            )
                          : Column(),
                    SizedBox(
                      height: height / 50,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
                      child: _summaryController.summarydata.value.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: _summaryController
                                  .summarydata.value[0].messages.imageUrl,
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.image_not_supported_outlined),
                            )
                          // Image.network(
                          //         _summaryController
                          //             .summarydata.value[0].messages.imageUrl,
                          //         fit: BoxFit.contain,
                          //       )
                          : Column(),
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Container(
                            width: width / 3.7,
                            height: height / 7,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeAnnualLeaves
                                          .toString())
                                      : 0.0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].annualLeaves
                                          .toString())
                                      : 20.0,
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
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeAnnualLeaves
                                                .toString())
                                            : 0.0,
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
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeAnnualLeaves.toString() + '/' + _summaryController.summarydata.value[0].annualLeaves.toString()}'
                                                : "${0}/${0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: DynamicColor()
                                                    .primarycolor))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.0, bottom: 5),
                                        child: Text('Annual Leave',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                                color:
                                                    DynamicColor().primarycolor,
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
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeAnnualLeaves
                                          .toString())
                                      : 0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].annualLeaves
                                          .toString())
                                      : 20,
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
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeAnnualLeaves
                                                .toString())
                                            : 0,
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
                                        value: 0,
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
                                        axisValue: 40,
                                        positionFactor: 0.1,
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeSickLeaves.toString() + '/' + _summaryController.summarydata.value[0].sickLeaves.toString()}'
                                                : "${0}/${0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFEC4A22)))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                          padding: EdgeInsets.only(
                                              top: 40.0, bottom: 5),
                                          child: Text('Sick Leave',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1,
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
                                  minimum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata
                                          .value[0]
                                          .consumeCasualLeaves
                                          .toString())
                                      : 0,
                                  maximum: _summaryController
                                          .summarydata.value.isNotEmpty
                                      ? double.parse(_summaryController
                                          .summarydata.value[0].casualLeaves
                                          .toString())
                                      : 20,
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
                                        value: _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? double.parse(_summaryController
                                                .summarydata
                                                .value[0]
                                                .consumeCasualLeaves
                                                .toString())
                                            : 0,
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
                                        widget: Text(
                                            _summaryController.summarydata.value
                                                    .isNotEmpty
                                                ? '${_summaryController.summarydata.value[0].consumeCasualLeaves.toString() + '/' + _summaryController.summarydata.value[0].casualLeaves.toString()}'
                                                : "${0}/${0}",
                                            style: TextStyle(
                                                fontSize: width / 27,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple))),
                                    GaugeAnnotation(
                                      angle: 90,
                                      axisValue: 5,
                                      positionFactor: 1.2,
                                      widget: Padding(
                                          padding: EdgeInsets.only(
                                              top: 40.0, bottom: 5),
                                          child: Text('Casual Leave',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1,
                                                  color: Colors.deepPurple,
                                                  fontSize: width / 36))),
                                    )
                                  ])
                            ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthPresentDays}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekPresentDays}'
                                        : "0",
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthAbsentDays}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekAbsentDays}'
                                        : '0',
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthTargetedHours}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekTargetedHours}'
                                        : '0',
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
                    DelayedDisplay(
                      fadeIn: true,
                      fadingDuration: Duration(milliseconds: 1200),
                      child: Row(
                        children: [
                          Container(
                            width: width / 3.7,
                            height:
                                _summaryController.summarydata.value.isNotEmpty
                                    ? _summaryController
                                                .weeklist
                                                .value[_summaryController
                                                    .weekupdate.value]
                                                .weekdata[0]
                                                .todayDataAvailability ==
                                            true
                                        ? height / 1.9
                                        : height / 2.3
                                    : height / 2.3,
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthHoursWorked}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekHoursWorked}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFFA24AAE),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Text(
                                      'Today',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: width / 29),
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Color(0XFFFBE4FE)),
                                      child: Text(
                                        _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].todayWorkHours}'
                                            : '0',
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
                            height:
                                _summaryController.summarydata.value.isNotEmpty
                                    ? _summaryController
                                                .weeklist
                                                .value[_summaryController
                                                    .weekupdate.value]
                                                .weekdata[0]
                                                .todayDataAvailability ==
                                            true
                                        ? height / 1.9
                                        : height / 2.3
                                    : height / 2.3,
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthShortHours}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekShortHours}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFAE1CE4),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Text(
                                      'Today',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: width / 29),
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Color(0XFFEBE4FE)),
                                      child: Text(
                                        _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].todayShortHours}'
                                            : '0',
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
                            height:
                                _summaryController.summarydata.value.isNotEmpty
                                    ? _summaryController
                                                .weeklist
                                                .value[_summaryController
                                                    .weekupdate.value]
                                                .weekdata[0]
                                                .todayDataAvailability ==
                                            true
                                        ? height / 1.9
                                        : height / 2.3
                                    : height / 2.3,
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
                                      color: Colors.blueAccent,
                                      fontSize: width / 27),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  'Month',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.summarydata.value[0].monthOverTime}'
                                        : '0',
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
                                      fontSize: width / 29),
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
                                    _summaryController
                                            .summarydata.value.isNotEmpty
                                        ? '${_summaryController.weeklist.value[0].weekdata[0].weekOverTime}'
                                        : '0',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1AC137),
                                        fontSize: width / 27),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Text(
                                      'Today',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: width / 29),
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                if (_summaryController
                                    .summarydata.value.isNotEmpty)
                                  if (_summaryController
                                          .weeklist
                                          .value[_summaryController
                                              .weekupdate.value]
                                          .weekdata[0]
                                          .todayDataAvailability ==
                                      true)
                                    Container(
                                      width: 80,
                                      height: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Color(0XFFE7FEEB)),
                                      child: Text(
                                        _summaryController
                                                .summarydata.value.isNotEmpty
                                            ? '${_summaryController.weeklist.value[_summaryController.weekupdate.value].weekdata[0].weekOverTime}'
                                            : '0',
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
                    SizedBox(
                      height: height / 2,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
