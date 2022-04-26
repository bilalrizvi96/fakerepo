// To parse this JSON data, do
//
//     final summaryAnalyticsModel = summaryAnalyticsModelFromJson(jsonString);

import 'dart:convert';

SummaryAnalyticsModel summaryAnalyticsModelFromJson(String str) =>
    SummaryAnalyticsModel.fromJson(json.decode(str));

String summaryAnalyticsModelToJson(SummaryAnalyticsModel data) =>
    json.encode(data.toJson());

class SummaryAnalyticsModel {
  SummaryAnalyticsModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory SummaryAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      SummaryAnalyticsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "code": code,
      };
}

class Datum {
  Datum({
    this.annualLeaves,
    this.sickLeaves,
    this.casualLeaves,
    this.consumeAnnualLeaves,
    this.consumeSickLeaves,
    this.consumeCasualLeaves,
    this.points,
    this.monthTargetedHours,
    this.monthPresentDays,
    this.monthAbsentDays,
    this.monthHoursWorked,
    this.monthShortHours,
    this.monthOverTime,
    this.messages,
    this.fourthWeek,
    this.thirdWeek,
    this.secondWeek,
    this.firstWeek,
  });

  var annualLeaves;
  var sickLeaves;
  var casualLeaves;
  var consumeAnnualLeaves;
  var consumeSickLeaves;
  var consumeCasualLeaves;
  var points;
  var monthTargetedHours;
  var monthPresentDays;
  var monthAbsentDays;
  var monthHoursWorked;
  var monthShortHours;
  var monthOverTime;
  var messages;
  var fourthWeek;
  var thirdWeek;
  var secondWeek;
  var firstWeek;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        annualLeaves: json["annualLeaves"],
        sickLeaves: json["sickLeaves"],
        casualLeaves: json["casualLeaves"],
        consumeAnnualLeaves: json["consumeAnnualLeaves"],
        consumeSickLeaves: json["consumeSickLeaves"],
        consumeCasualLeaves: json["consumeCasualLeaves"],
        points: json["points"],
        monthTargetedHours: json["monthTargetedHours"],
        monthPresentDays: json["monthPresentDays"],
        monthAbsentDays: json["monthAbsentDays"],
        monthHoursWorked: json["monthHoursWorked"],
        monthShortHours: json["monthShortHours"],
        monthOverTime: json["monthOverTime"],
        messages: Messages.fromJson(json["messages"]),
        fourthWeek:
            List<Week>.from(json["fourthWeek"].map((x) => Week.fromJson(x))),
        thirdWeek:
            List<Week>.from(json["thirdWeek"].map((x) => Week.fromJson(x))),
        secondWeek:
            List<Week>.from(json["secondWeek"].map((x) => Week.fromJson(x))),
        firstWeek:
            List<Week>.from(json["firstWeek"].map((x) => Week.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "annualLeaves": annualLeaves,
        "sickLeaves": sickLeaves,
        "casualLeaves": casualLeaves,
        "consumeAnnualLeaves": consumeAnnualLeaves,
        "consumeSickLeaves": consumeSickLeaves,
        "consumeCasualLeaves": consumeCasualLeaves,
        "points": points,
        "monthTargetedHours": monthTargetedHours,
        "monthPresentDays": monthPresentDays,
        "monthAbsentDays": monthAbsentDays,
        "monthHoursWorked": monthHoursWorked,
        "monthShortHours": monthShortHours,
        "monthOverTime": monthOverTime,
        "messages": messages.toJson(),
        "fourthWeek": List<dynamic>.from(fourthWeek.map((x) => x.toJson())),
        "thirdWeek": List<dynamic>.from(thirdWeek.map((x) => x.toJson())),
        "secondWeek": List<dynamic>.from(secondWeek.map((x) => x.toJson())),
        "firstWeek": List<dynamic>.from(firstWeek.map((x) => x.toJson())),
      };
}

class Week {
  Week({
    this.weekPresentDays,
    this.weekAbsentDays,
    this.weekTargetedHours,
    this.weekHoursWorked,
    this.weekShortHours,
    this.weekOverTime,
    this.todayDataAvailability,
    this.todayWorkHours,
    this.todayOverTime,
    this.todayShortHours,
    this.message,
    this.alert,
  });

  var weekPresentDays;
  var weekAbsentDays;
  var weekTargetedHours;
  var weekHoursWorked;
  var weekShortHours;
  var weekOverTime;
  var message;
  var todayDataAvailability;
  var todayWorkHours;
  var todayShortHours;
  var todayOverTime;
  var alert;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
        weekPresentDays: json["weekPresentDays"],
        weekAbsentDays: json["weekAbsentDays"],
        weekTargetedHours: json["weekTargetedHours"],
        weekHoursWorked: json["weekHoursWorked"],
        weekShortHours: json["weekShortHours"],
        todayDataAvailability: json["todayDataAvailability"],
        todayWorkHours: json["todayWorkHours"],
        todayShortHours: json["todayShortHours"],
        todayOverTime: json["todayOverTime"],
        weekOverTime: json["weekOverTime"],
        message: json["message"],
        alert: Messages.fromJson(json["alert"]),
      );

  Map<String, dynamic> toJson() => {
        "weekPresentDays": weekPresentDays,
        "weekAbsentDays": weekAbsentDays,
        "weekTargetedHours": weekTargetedHours,
        "weekHoursWorked": weekHoursWorked,
        "weekShortHours": weekShortHours,
        "todayDataAvailability": todayDataAvailability,
        "todayWorkHours": todayWorkHours,
        "todayShortHours": todayShortHours,
        "todayOverTime": todayOverTime,
        "weekOverTime": weekOverTime,
        "message": message,
        "alert": alert.toJson(),
      };
}

class Messages {
  Messages({
    this.id,
    this.type,
    this.subType,
    this.message,
    this.imageUrl,
    this.color,
    this.shiftType,
    this.textcolor,
  });

  var id;
  var type;
  var color;
  var subType;
  var message;
  var imageUrl;
  var shiftType;
  var textcolor;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        id: json["_id"],
        type: json["type"],
        subType: json["subType"] == null ? null : json["subType"],
        message: json["message"],
        imageUrl: json["imageUrl"],
        shiftType: json["shiftType"] == null ? null : json["shiftType"],
        color: json["color"] == null ? null : json["color"],
        textcolor: json["textcolor"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "subType": subType == null ? null : subType,
        "message": message,
        "imageUrl": imageUrl,
        "color": color,
        "textcolor": textcolor,
        "shiftType": shiftType == null ? null : shiftType,
      };
}
