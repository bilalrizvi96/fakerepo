// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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
    this.id,
    this.title,
    this.employeeId,
    this.message,
    this.date,
    this.time,
  });

  var id;
  var title;
  var employeeId;
  var message;
  var date;
  var time;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        employeeId: json["employeeId"],
        message: json["message"] == null ? null : json["message"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "employeeId": employeeId,
        "message": message == null ? null : message,
        "date": date,
        "time": time,
      };
}
