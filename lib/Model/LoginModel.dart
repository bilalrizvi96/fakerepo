// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.token,
    required this.user,
  });

  String token;
  List<User> user;

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
    required this.id,
    required this.code,
    required this.empCode,
    required this.name,
    required this.phoneNo,
    required this.eMail,
    required this.faceVerification,
    required this.profile,
  });

  String id;
  String code;
  String empCode;
  String name;
  String phoneNo;
  String eMail;
  bool faceVerification;
  List<Profile> profile;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        code: json["Code"],
        empCode: json["EmpCode"],
        name: json["Name"],
        phoneNo: json["PhoneNo"],
        eMail: json["EMail"],
        faceVerification: json["FaceVerification"],
        profile:
            List<Profile>.from(json["profile"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Code": code,
        "EmpCode": empCode,
        "Name": name,
        "PhoneNo": phoneNo,
        "EMail": eMail,
        "FaceVerification": faceVerification,
        "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.dateOfJoining,
    required this.designation,
    required this.shiftTiming,
    required this.employeeId,
  });

  String id;
  String firstName;
  String lastName;
  String address;
  String dateOfJoining;
  String designation;
  String shiftTiming;
  String employeeId;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        dateOfJoining: json["date_of_joining"],
        designation: json["designation"],
        shiftTiming: json["shift_timing"],
        employeeId: json["employeeId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "date_of_joining": dateOfJoining,
        "designation": designation,
        "shift_timing": shiftTiming,
        "employeeId": employeeId,
      };
}
