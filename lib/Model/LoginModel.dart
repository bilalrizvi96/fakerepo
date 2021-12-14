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
    this.code,
    this.empCode,
    this.name,
    this.phoneNo,
    this.eMail,
    this.registered,
    this.hoursPerWeek,
    this.hoursPerDay,
    this.shiftType,
    this.offPerYear,
    this.role,
    this.pin,
    this.offDay,
    this.status,
    this.profile,
    this.presentDays,
    this.absentDays,
  });

  var id;
  var code;
  var empCode;
  var name;
  var phoneNo;
  var eMail;
  var registered;
  var hoursPerWeek;
  var hoursPerDay;
  var shiftType;
  var offPerYear;
  var role;
  var pin;
  var offDay;
  var status;
  var profile;
  var presentDays;
  var absentDays;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        code: json["Code"],
        empCode: json["EmpCode"],
        name: json["Name"],
        phoneNo: json["PhoneNo"],
        eMail: json["EMail"],
        registered: json["Registered"],
        hoursPerWeek: json["hours_per_week"],
        hoursPerDay: json["hours_per_day"],
        shiftType: json["shift_type"],
        offPerYear: json["off_per_year"],
        role: json["role"],
        pin: json["pin"],
        offDay: List<String>.from(json["off_day"].map((x) => x)),
        status: json["status"],
        profile:
            List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Code": code,
        "EmpCode": empCode,
        "Name": name,
        "PhoneNo": phoneNo,
        "EMail": eMail,
        "Registered": registered,
        "hours_per_week": hoursPerWeek,
        "hours_per_day": hoursPerDay,
        "shift_type": shiftType,
        "off_per_year": offPerYear,
        "role": role,
        "pin": pin,
        "off_day": List<dynamic>.from(offDay.map((x) => x)),
        "status": status,
        "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
        "present_days": presentDays,
        "absent_days": absentDays,
      };
}

class Profile {
  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.empCode,
    this.dateOfJoining,
    this.designation,
    this.shiftTiming,
    this.employeeId,
    this.shiftType,
  });

  var id;
  var firstName;
  var lastName;
  var address;
  var empCode;
  var dateOfJoining;
  var designation;
  var shiftTiming;
  var employeeId;
  var shiftType;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        empCode: json["EmpCode"],
        dateOfJoining: json["date_of_joining"],
        designation: json["designation"],
        shiftTiming: json["shift_timing"],
        employeeId: json["employeeId"],
        shiftType: json["shift_type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "EmpCode": empCode,
        "date_of_joining": dateOfJoining,
        "designation": designation,
        "shift_timing": shiftTiming,
        "employeeId": employeeId,
        "shift_type": shiftType,
      };
}
