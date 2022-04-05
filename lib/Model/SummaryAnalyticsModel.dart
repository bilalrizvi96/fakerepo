// To parse this JSON data, do
//
//     final summaryAnalytics = summaryAnalyticsFromJson(jsonString);

import 'dart:convert';

SummaryAnalytics summaryAnalyticsFromJson(String str) =>
    SummaryAnalytics.fromJson(json.decode(str));

String summaryAnalyticsToJson(SummaryAnalytics data) =>
    json.encode(data.toJson());

class SummaryAnalytics {
  SummaryAnalytics({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory SummaryAnalytics.fromJson(Map<String, dynamic> json) =>
      SummaryAnalytics(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
        "code": code,
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        fourthWeek: Week.fromJson(json["fourthWeek"]),
        thirdWeek: Week.fromJson(json["thirdWeek"]),
        secondWeek: Week.fromJson(json["secondWeek"]),
        firstWeek: Week.fromJson(json["firstWeek"]),
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
        "fourthWeek": fourthWeek.toJson(),
        "thirdWeek": thirdWeek.toJson(),
        "secondWeek": secondWeek.toJson(),
        "firstWeek": firstWeek.toJson(),
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
    this.message,
  });

  var weekPresentDays;
  var weekAbsentDays;
  var weekTargetedHours;
  var weekHoursWorked;
  var weekShortHours;
  var weekOverTime;
  var message;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
        weekPresentDays: json["weekPresentDays"],
        weekAbsentDays: json["weekAbsentDays"],
        weekTargetedHours: json["weekTargetedHours"],
        weekHoursWorked: json["weekHoursWorked"],
        weekShortHours: json["weekShortHours"],
        weekOverTime: json["weekOverTime"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "weekPresentDays": weekPresentDays,
        "weekAbsentDays": weekAbsentDays,
        "weekTargetedHours": weekTargetedHours,
        "weekHoursWorked": weekHoursWorked,
        "weekShortHours": weekShortHours,
        "weekOverTime": weekOverTime,
        "message": message,
      };
}

class Messages {
  Messages({
    this.id,
    this.type,
    this.shiftType,
    this.message,
    this.imageUrl,
  });

  var id;
  var type;
  var shiftType;
  var message;
  var imageUrl;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        id: json["_id"],
        type: json["type"],
        shiftType: json["shiftType"],
        message: json["message"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "shiftType": shiftType,
        "message": message,
        "imageUrl": imageUrl,
      };
}
