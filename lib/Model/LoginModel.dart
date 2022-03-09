import 'dart:convert';

LoginModel loginModelFromJson(var str) => LoginModel.fromJson(json.decode(str));

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
  User(
      {this.id,
      this.empCode,
      this.eMail,
      this.name,
      this.phoneNo,
      this.registered,
      this.designation,
      this.endTiming,
      this.firstName,
      this.hoursPerDay,
      this.hoursPerWeek,
      this.lastName,
      this.offDay,
      this.offPerYear,
      this.shiftType,
      this.startTiming,
      this.status,
      this.checkIn,
      this.checkOut,
      this.presentDays,
      this.absentDays,
      this.address});

  var id;
  var empCode;
  var eMail;
  var name;
  var phoneNo;
  var registered;
  var designation;
  var endTiming;
  var firstName;
  var hoursPerDay;
  var hoursPerWeek;
  var lastName;
  var offDay;
  var offPerYear;
  var shiftType;
  var startTiming;
  var status;
  var checkIn;
  var checkOut;
  var presentDays;
  var absentDays;
  var address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        empCode: json["EmpCode"],
        eMail: json["EMail"],
        name: json["Name"],
        phoneNo: json["PhoneNo"],
        registered: json["Registered"],
        designation: json["designation"],
        endTiming: json["end_timing"],
        firstName: json["first_name"],
        hoursPerDay: json["hours_per_day"],
        hoursPerWeek: json["hours_per_week"],
        lastName: json["last_name"],
        offDay: List<String>.from(json["off_day"].map((x) => x)),
        offPerYear: json["off_per_year"],
        shiftType: json["shift_type"],
        startTiming: json["start_timing"],
        status: json["status"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "EmpCode": empCode,
        "EMail": eMail,
        "Name": name,
        "PhoneNo": phoneNo,
        "Registered": registered,
        "designation": designation,
        "end_timing": endTiming,
        "first_name": firstName,
        "hours_per_day": hoursPerDay,
        "hours_per_week": hoursPerWeek,
        "last_name": lastName,
        "off_day": List<dynamic>.from(offDay.map((x) => x)),
        "off_per_year": offPerYear,
        "shift_type": shiftType,
        "start_timing": startTiming,
        "status": status,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "present_days": presentDays,
        "absent_days": absentDays,
        "address": address,
      };
}
