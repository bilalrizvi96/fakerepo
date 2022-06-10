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
    this.color,
    this.date,
    this.title,
  });

  var color;
  var date;
  var title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        color: json["color"],
        date: json["date"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "date": date,
        "title": title,
      };
}
