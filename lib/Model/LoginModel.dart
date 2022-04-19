// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.token,
    this.user,
  });

  var token;
  var user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.id,
    this.empCode,
    this.name,
    this.designation,
    this.phoneNo,
    this.eMail,
    this.region,
    this.firstName,
    this.lastName,
    this.startTiming,
    this.endTiming,
    this.active,
    this.status,
    this.registered,
    this.shiftType,
    this.offPerYear,
    this.hoursPerDay,
    this.hoursPerWeek,
    this.offDay,
    this.address,
    this.points,
    this.consumeAnnualLeaves,
    this.consumeSickLeaves,
    this.consumeCasualLeaves,
    this.checkpointAccess,
    this.lastAttendanceRecordDate,
    this.isMessageAvailable,
    this.message,
    this.firstAttendanceRecordDate,
    this.checkIn,
    this.checkOut,
    this.dateForMissingCheckout,
    this.checkOutMissing,
    this.presentDays,
    this.absentDays,
  });

  var id;
  var empCode;
  var name;
  var designation;
  var phoneNo;
  var eMail;
  var region;
  var firstName;
  var lastName;
  var startTiming;
  var endTiming;
  var active;
  var status;
  var registered;
  var shiftType;
  var offPerYear;
  var hoursPerDay;
  var hoursPerWeek;
  var offDay;
  var address;
  var points;
  var consumeAnnualLeaves;
  var consumeSickLeaves;
  var consumeCasualLeaves;
  var checkpointAccess;
  var lastAttendanceRecordDate;
  var isMessageAvailable;
  var message;
  var firstAttendanceRecordDate;
  var checkIn;
  var checkOut;
  var dateForMissingCheckout;
  var checkOutMissing;
  var presentDays;
  var absentDays;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        empCode: json["EmpCode"],
        name: json["Name"],
        designation: json["designation"],
        phoneNo: json["PhoneNo"],
        eMail: json["EMail"],
        region: json["region"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        startTiming: json["start_timing"],
        endTiming: json["end_timing"],
        active: json["active"],
        status: json["status"],
        registered: json["Registered"],
        shiftType: json["shift_type"],
        offPerYear: json["off_per_year"],
        hoursPerDay: json["hours_per_day"],
        hoursPerWeek: json["hours_per_week"],
        offDay: List<String>.from(json["off_day"].map((x) => x)),
        address: json["address"],
        points: json["points"],
        consumeAnnualLeaves: json["consumeAnnualLeaves"],
        consumeSickLeaves: json["consumeSickLeaves"],
        consumeCasualLeaves: json["consumeCasualLeaves"],
        checkpointAccess: json["checkpointAccess"],
        lastAttendanceRecordDate: json["lastAttendanceRecordDate"],
        isMessageAvailable: json["isMessageAvailable"],
        message: Message.fromJson(json["message"]),
        firstAttendanceRecordDate: json["firstAttendanceRecordDate"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        dateForMissingCheckout: json["dateForMissingCheckout"],
        checkOutMissing: json["checkOutMissing"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "EmpCode": empCode,
        "Name": name,
        "designation": designation,
        "PhoneNo": phoneNo,
        "EMail": eMail,
        "region": region,
        "first_name": firstName,
        "last_name": lastName,
        "start_timing": startTiming,
        "end_timing": endTiming,
        "active": active,
        "status": status,
        "Registered": registered,
        "shift_type": shiftType,
        "off_per_year": offPerYear,
        "hours_per_day": hoursPerDay,
        "hours_per_week": hoursPerWeek,
        "off_day": List<dynamic>.from(offDay.map((x) => x)),
        "address": address,
        "points": points,
        "consumeAnnualLeaves": consumeAnnualLeaves,
        "consumeSickLeaves": consumeSickLeaves,
        "consumeCasualLeaves": consumeCasualLeaves,
        "checkpointAccess": checkpointAccess,
        "lastAttendanceRecordDate": lastAttendanceRecordDate,
        "isMessageAvailable": isMessageAvailable,
        "message": message.toJson(),
        "firstAttendanceRecordDate": firstAttendanceRecordDate,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "checkOut": dateForMissingCheckout,
        "checkOutMissing": checkOutMissing,
        "present_days": presentDays,
        "absent_days": absentDays,
      };
}

class Message {
  Message(
      {this.id,
      this.type,
      this.shiftType,
      this.message,
      this.imageUrl,
      this.title});

  var id;
  var type;
  var shiftType;
  var message;
  var imageUrl;
  var title;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        type: json["type"],
        shiftType: json["shiftType"],
        message: json["message"],
        imageUrl: json["imageUrl"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "shiftType": shiftType,
        "message": message,
        "imageUrl": imageUrl,
        "title": title,
      };
}
