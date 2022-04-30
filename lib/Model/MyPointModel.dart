// To parse this JSON data, do
//
//     final myPointModel = myPointModelFromJson(jsonString);

import 'dart:convert';

MyPointModel myPointModelFromJson(String str) =>
    MyPointModel.fromJson(json.decode(str));

String myPointModelToJson(MyPointModel data) => json.encode(data.toJson());

class MyPointModel {
  MyPointModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory MyPointModel.fromJson(Map<String, dynamic> json) => MyPointModel(
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
    this.points,
    this.date,
    this.walletTitle,
    this.color,
  });

  var type;
  var points;
  var date;
  var walletTitle;
  var color;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        points: json["points"],
        date: json["date"],
        walletTitle: json["walletTitle"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "points": points,
        "date": date,
        "walletTitle": walletTitle,
        "color": color,
      };
}
