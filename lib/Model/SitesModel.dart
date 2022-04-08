// To parse this JSON data, do
//
//     final sitesModel = sitesModelFromJson(jsonString);

import 'dart:convert';

SitesModel sitesModelFromJson(String str) =>
    SitesModel.fromJson(json.decode(str));

String sitesModelToJson(SitesModel data) => json.encode(data.toJson());

class SitesModel {
  SitesModel({
    this.data,
  });

  var data;

  factory SitesModel.fromJson(Map<String, dynamic> json) => SitesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.sitesName,
    this.address,
    this.type,
    this.location,
    this.siteSwitch,
    this.region,
  });

  var id;
  var sitesName;
  var address;
  var type;
  var location;
  var siteSwitch;
  var region;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        sitesName: json["SitesName"],
        address: json["Address"],
        type: json["Type"],
        location: json["location"],
        siteSwitch: json["Site_switch"],
        region: json["region"] == null ? null : json["region"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "SitesName": sitesName,
        "Address": address,
        "Type": type,
        "location": location,
        "Site_switch": siteSwitch,
        "region": region == null ? null : region,
      };
}
