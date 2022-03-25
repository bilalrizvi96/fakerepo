// To parse this JSON data, do
//
//     final historyCheckpointModel = historyCheckpointModelFromJson(jsonString);

import 'dart:convert';

HistoryCheckpointModel historyCheckpointModelFromJson(String str) =>
    HistoryCheckpointModel.fromJson(json.decode(str));

String historyCheckpointModelToJson(HistoryCheckpointModel data) =>
    json.encode(data.toJson());

class HistoryCheckpointModel {
  HistoryCheckpointModel({
    this.status,
    this.data,
    this.message,
  });

  var status;
  var data;
  var message;

  factory HistoryCheckpointModel.fromJson(Map<String, dynamic> json) =>
      HistoryCheckpointModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.empCode,
    this.name,
    this.region,
    this.checkPoints,
  });

  var id;
  var empCode;
  var name;
  var region;
  var checkPoints;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        empCode: json["empCode"],
        name: json["name"],
        region: json["region"],
        checkPoints: List<CheckPoint>.from(
            json["checkPoints"].map((x) => CheckPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "empCode": empCode,
        "name": name,
        "region": region,
        "checkPoints": List<dynamic>.from(checkPoints.map((x) => x.toJson())),
      };
}

class CheckPoint {
  CheckPoint({
    this.image,
    this.siteName,
    this.location,
    this.notes,
    this.time,
  });

  var image;
  var siteName;
  var location;
  var notes;
  var time;

  factory CheckPoint.fromJson(Map<String, dynamic> json) => CheckPoint(
        image: json["image"],
        siteName: json["siteName"],
        location: json["location"],
        notes: json["notes"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "siteName": siteName,
        "location": location,
        "notes": notes,
        "time": time,
      };
}
