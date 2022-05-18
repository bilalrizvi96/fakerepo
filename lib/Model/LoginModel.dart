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
    this.sites,
    this.summaryGuideline,
  });

  var token;
  var user;
  var sites;
  var summaryGuideline;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        sites: List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
        summaryGuideline: List<SummaryGuideline>.from(
            json["summaryGuideline"].map((x) => SummaryGuideline.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "sites": List<dynamic>.from(sites.map((x) => x.toJson())),
        "summaryGuideline":
            List<dynamic>.from(summaryGuideline.map((x) => x.toJson())),
      };
}

class Site {
  Site({
    this.id,
    this.sitesName,
    this.address,
    this.siteSwitch,
    this.type,
    this.distanceInMeters,
    this.location,
    this.region,
  });

  var id;
  var sitesName;
  var address;
  var siteSwitch;
  var type;
  var distanceInMeters;
  var location;
  var region;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        id: json["_id"],
        sitesName: json["SitesName"],
        address: json["Address"],
        siteSwitch: json["Site_switch"],
        type: json["Type"],
        distanceInMeters: json["distanceInMeters"],
        location: json["location"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "SitesName": sitesName,
        "Address": address,
        "Site_switch": siteSwitch,
        "Type": type,
        "distanceInMeters": distanceInMeters,
        "location": location,
        "region": region,
      };
}

class SummaryGuideline {
  SummaryGuideline({
    this.id,
    this.title,
    this.decription,
    this.point,
    this.textcolor,
    this.color,
  });

  var id;
  var title;
  var decription;
  var point;
  var textcolor;
  var color;

  factory SummaryGuideline.fromJson(Map<String, dynamic> json) =>
      SummaryGuideline(
        id: json["_id"],
        title: json["Title"],
        decription: json["decription"],
        point: json["point"],
        textcolor: json["textcolor"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Title": title,
        "decription": decription,
        "point": point,
        "textcolor": textcolor,
        "color": color,
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
    this.deviceToken,
    this.department,
    this.lastAttendanceRecordDate,
    this.isMessageAvailable,
    this.message,
    this.firstAttendanceRecordDate,
    this.checkIn,
    this.checkOut,
    this.checkOutMissing,
    this.dateForMissingCheckout,
    this.presentDays,
    this.absentDays,
    this.version,
    this.role,
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
  var deviceToken;
  var department;
  var role;
  var lastAttendanceRecordDate;
  var isMessageAvailable;
  var message;
  var firstAttendanceRecordDate;
  var checkIn;
  var checkOut;
  var checkOutMissing;
  var dateForMissingCheckout;
  var presentDays;
  var absentDays;
  var version;

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
        deviceToken: json["deviceToken"],
        department: json["department"],
        role: json["role"],
        lastAttendanceRecordDate: json["lastAttendanceRecordDate"],
        isMessageAvailable: json["isMessageAvailable"],
        message: Message.fromJson(json["message"]),
        firstAttendanceRecordDate: json["firstAttendanceRecordDate"],
        checkIn: json["checkIn"],
        checkOut: json["checkOut"],
        checkOutMissing: json["checkOutMissing"],
        dateForMissingCheckout: json["dateForMissingCheckout"],
        presentDays: json["present_days"],
        absentDays: json["absent_days"],
        version: Version.fromJson(json["version"]),
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
        "deviceToken": deviceToken,
        "department": department,
        "role": role,
        "lastAttendanceRecordDate": lastAttendanceRecordDate,
        "isMessageAvailable": isMessageAvailable,
        "message": message.toJson(),
        "firstAttendanceRecordDate": firstAttendanceRecordDate,
        "checkIn": checkIn,
        "checkOut": checkOut,
        "checkOutMissing": checkOutMissing,
        "dateForMissingCheckout": dateForMissingCheckout,
        "present_days": presentDays,
        "absent_days": absentDays,
        "version": version.toJson(),
      };
}

class Message {
  Message({
    this.id,
    this.type,
    this.title,
    this.subType,
    this.message,
    this.imageUrl,
  });

  var id;
  var type;
  var title;
  var subType;
  var message;
  var imageUrl;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        type: json["type"],
        title: json["title"],
        subType: json["subType"],
        message: json["message"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "title": title,
        "subType": subType,
        "message": message,
        "imageUrl": imageUrl,
      };
}

class Version {
  Version({
    this.id,
    this.version,
    this.link,
    this.message,
    this.availableRelease,
    this.currentRelease,
    this.updateAvailability,
  });

  var id;
  var version;
  var link;
  var message;
  var availableRelease;
  var currentRelease;
  var updateAvailability;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        id: json["_id"],
        version: json["version"],
        link: json["link"],
        message: json["message"],
        availableRelease: json["availableRelease"],
        currentRelease: json["currentRelease"],
        updateAvailability: json["updateAvailability"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "version": version,
        "link": link,
        "message": message,
        "availableRelease": availableRelease,
        "currentRelease": currentRelease,
        "updateAvailability": updateAvailability,
      };
}
