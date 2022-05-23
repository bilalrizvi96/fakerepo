// To parse this JSON data, do
//
//     final supportRequestModel = supportRequestModelFromJson(jsonString);

import 'dart:convert';

SupportRequestModel supportRequestModelFromJson(String str) =>
    SupportRequestModel.fromJson(json.decode(str));

String supportRequestModelToJson(SupportRequestModel data) =>
    json.encode(data.toJson());

class SupportRequestModel {
  SupportRequestModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory SupportRequestModel.fromJson(Map<String, dynamic> json) =>
      SupportRequestModel(
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
    this.type,
    this.time,
    this.date,
    this.employeeId,
    this.image,
    this.message,
    this.phone,
    this.name,
    this.region,
    this.resolved,
  });

  var type;
  var time;
  var date;
  var employeeId;
  var image;
  var message;
  var phone;
  var name;
  var region;
  var resolved;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        time: json["time"],
        date: json["date"],
        employeeId: json["employeeId"],
        image: json["image"],
        message: json["message"],
        phone: json["phone"],
        name: json["name"],
        region: json["region"],
        resolved: json["resolved"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "time": time,
        "date": date,
        "employeeId": employeeId,
        "image": image,
        "message": message,
        "phone": phone,
        "name": name,
        "region": region,
        "resolved": resolved,
      };
}
