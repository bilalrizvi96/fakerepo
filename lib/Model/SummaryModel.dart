// To parse this JSON data, do
//
//     final summaryModel = summaryModelFromJson(jsonString);

import 'dart:convert';

List<SummaryModel> summaryModelFromJson(String str) => List<SummaryModel>.from(
    json.decode(str).map((x) => SummaryModel.fromJson(x)));

String summaryModelToJson(List<SummaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SummaryModel {
  SummaryModel({
    this.start,
    this.end,
  });

  var start;
  var end;

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
        start: End.fromJson(json["start"]),
        end: End.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "start": start.toJson(),
        "end": end.toJson(),
      };
}

class End {
  End({
    this.date,
    this.location,
    this.siteId,
  });

  var date;
  var location;
  var siteId;

  factory End.fromJson(Map<String, dynamic> json) => End(
        date: DateTime.parse(json["date"]),
        location: json["location"],
        siteId: json["siteId"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "location": location,
        "siteId": siteId,
      };
}

enum Location { EMPTY, THE_23283728931237892738912 }
