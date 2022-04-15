// To parse this JSON data, do
//
//     final summaryDetailsModel = summaryDetailsModelFromJson(jsonString);

import 'dart:convert';

SummaryDetailsModel summaryDetailsModelFromJson(String str) =>
    SummaryDetailsModel.fromJson(json.decode(str));

String summaryDetailsModelToJson(SummaryDetailsModel data) =>
    json.encode(data.toJson());

class SummaryDetailsModel {
  SummaryDetailsModel({
    this.dailyDetails,
    this.checkIn,
    this.checkOut,
    this.checkOutMissing,
    this.totalDays,
    this.holidaysPresentCount,
    this.presentDays,
    this.absentDays,
    this.offDay,
    this.startTiming,
    this.endTiming,
    this.expectedTime,
    this.totalHoursWorked,
    this.shortHours,
    this.overTime,
  });

  var dailyDetails;
  var checkIn;
  var checkOut;
  var checkOutMissing;
  var totalDays;
  var holidaysPresentCount;
  var presentDays;
  var absentDays;
  var offDay;
  var startTiming;
  var endTiming;
  var expectedTime;
  var totalHoursWorked;
  var shortHours;
  var overTime;

  factory SummaryDetailsModel.fromJson(Map<String, dynamic> json) =>
      SummaryDetailsModel(
        dailyDetails: List<DailyDetail>.from(
            json["daily_details"].map((x) => DailyDetail.fromJson(x))),
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        checkOutMissing: json["checkOutMissing"],
        totalDays: json["totalDays"],
        holidaysPresentCount: json["holidaysPresentCount"],
        presentDays: json["presentDays"],
        absentDays: json["absentDays"],
        offDay: json["offDay"],
        startTiming: json["startTiming"],
        endTiming: json["endTiming"],
        expectedTime: json["expectedTime"],
        totalHoursWorked: json["totalHoursWorked"],
        shortHours: json["shortHours"],
        overTime: json["overTime"],
      );

  Map<String, dynamic> toJson() => {
        "daily_details":
            List<dynamic>.from(dailyDetails.map((x) => x.toJson())),
        "checkIn": checkIn,
        "checkOut": checkOut,
        "checkOutMissing": checkOutMissing,
        "totalDays": totalDays,
        "holidaysPresentCount": holidaysPresentCount,
        "presentDays": presentDays,
        "absentDays": absentDays,
        "offDay": offDay,
        "startTiming": startTiming,
        "endTiming": endTiming,
        "expectedTime": expectedTime,
        "totalHoursWorked": totalHoursWorked,
        "shortHours": shortHours,
        "overTime": overTime,
      };
}

class DailyDetail {
  DailyDetail({
    this.empCode,
    this.name,
    this.date,
    this.mobileDate,
    this.dayStatus,
    this.checkInDate,
    this.checkInLocation,
    this.checkInSiteId,
    this.checkOutDate,
    this.checkOutLocation,
    this.checkOutSiteId,
    this.workTime,
    this.lateTime,
    this.overTime,
    this.dayInWords,
    this.shortTime,
  });

  var empCode;
  var name;
  var dayInWords;
  var date;
  var mobileDate;
  var dayStatus;
  var checkInDate;
  var checkInLocation;
  var checkInSiteId;
  var checkOutDate;
  var checkOutLocation;
  var checkOutSiteId;
  var workTime;
  var lateTime;
  var overTime;
  var shortTime;

  factory DailyDetail.fromJson(Map<String, dynamic> json) => DailyDetail(
        empCode: json["EmpCode"],
        name: json["Name"],
        date: json["Date"],
        mobileDate: json["mobileDate"],
        dayStatus: json["dayStatus"],
        checkInDate: json["CheckIn_date"],
        checkInLocation: json["CheckIn_location"],
        checkInSiteId: json["CheckIn_siteId"],
        checkOutDate: json["CheckOut_date"],
        checkOutLocation: json["CheckOut_location"],
        checkOutSiteId: json["CheckOut_siteId"],
        workTime: json["Work_time"],
        lateTime: json["Late_time"],
        overTime: json["Over_time "],
        dayInWords: json["dayInWords"],
        shortTime: json["shortTime "],
      );

  Map<String, dynamic> toJson() => {
        "EmpCode": empCode,
        "Name": name,
        "Date": date,
        "mobileDate": mobileDate,
        "dayStatus": dayStatus,
        "CheckIn_date": checkInDate,
        "CheckIn_location": checkInLocation,
        "CheckIn_siteId": checkInSiteId,
        "CheckOut_date": checkOutDate,
        "CheckOut_location": checkOutLocation,
        "CheckOut_siteId": checkOutSiteId,
        "Work_time": workTime,
        "Late_time": lateTime,
        "Over_time ": overTime,
        "shortTime ": shortTime,
        "dayInWords ": dayInWords,
      };
}
