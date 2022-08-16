// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    this.status,
    this.data,
    this.message,
  });

  var status;
  var data;
  var message;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
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
    this.empCode,
    this.name,
    this.location,
  });

  var empCode;
  var name;
  var location;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        empCode: json["empCode"],
        name: json["name"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "empCode": empCode,
        "name": name,
        "location": location,
      };
}
