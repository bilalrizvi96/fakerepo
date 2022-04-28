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
    this.type,
    this.time,
    this.employeeId,
    this.message,
    this.phone,
    this.image,
    this.resolved,
    this.name,
    this.region,
    this.date,
    this.reason,
  });

  var id;
  var type;
  var time;
  var employeeId;
  var message;
  var phone;
  var image;
  var resolved;
  var name;
  var region;
  var date;
  var reason;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        type: json["type"],
        time: json["time"],
        employeeId: json["employeeId"],
        message: json["message"],
        phone: json["phone"],
        image: json["image"],
        resolved: json["resolved"],
        name: json["name"],
        region: json["region"],
        date: json["date"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "time": time,
        "employeeId": employeeId,
        "message": message,
        "phone": phone,
        "image": image,
        "resolved": resolved,
        "name": name,
        "region": region,
        "date": date,
        "reason": reason,
      };
}
