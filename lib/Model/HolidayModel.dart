// To parse this JSON data, do
//
//     final holidayModel = holidayModelFromJson(jsonString);

import 'dart:convert';

HolidayModel holidayModelFromJson(String str) =>
    HolidayModel.fromJson(json.decode(str));

String holidayModelToJson(HolidayModel data) => json.encode(data.toJson());

class HolidayModel {
  HolidayModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory HolidayModel.fromJson(Map<String, dynamic> json) => HolidayModel(
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
    this.dates,
    this.colors,
  });

  var dates;
  var colors;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        colors: Colors.fromJson(json["colors"]),
      );

  Map<String, dynamic> toJson() => {
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "colors": colors.toJson(),
      };
}

class Colors {
  Colors({
    this.morning,
    this.evening,
    this.night,
    this.holidays,
    this.off,
  });

  var morning;
  var evening;
  var night;
  var holidays;
  var off;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        morning: json["morning"],
        evening: json["evening"],
        night: json["night"],
        holidays: json["holidays"],
        off: json["off"],
      );

  Map<String, dynamic> toJson() => {
        "morning": morning,
        "evening": evening,
        "night": night,
        "holidays": holidays,
        "off": off,
      };
}

class Date {
  Date({
    this.title,
    this.color,
    this.date,
  });

  var title;
  var color;
  var date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        title: json["title"],
        color: json["color"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "color": color,
        "date": date,
      };
}
