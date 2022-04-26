// To parse this JSON data, do
//
//     final summaryGuidelineModel = summaryGuidelineModelFromJson(jsonString);

import 'dart:convert';

SummaryGuidelineModel summaryGuidelineModelFromJson(String str) =>
    SummaryGuidelineModel.fromJson(json.decode(str));

String summaryGuidelineModelToJson(SummaryGuidelineModel data) =>
    json.encode(data.toJson());

class SummaryGuidelineModel {
  SummaryGuidelineModel({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  var status;
  var data;
  var message;
  var code;

  factory SummaryGuidelineModel.fromJson(Map<String, dynamic> json) =>
      SummaryGuidelineModel(
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
    this.title,
    this.decription,
    this.point,
    this.textcolor,
    this.color,
  });

  var title;
  var decription;
  var point;
  var textcolor;
  var color;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["Title"],
        decription: json["decription"],
        point: json["point"],
        textcolor: json["textcolor"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "decription": decription,
        "point": point,
        "textcolor": textcolor,
        "color": color,
      };
}
