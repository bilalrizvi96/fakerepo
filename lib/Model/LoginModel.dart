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
    this.offPerYear,
    this.hoursPerDay,
    this.hoursPerWeek,
    this.address,
    this.points,
    this.consumeAnnualLeaves,
    this.consumeCasualLeaves,
    this.consumeSickLeaves,
    // this.checkpointAccess,
    this.role,
    this.pin,
    this.isCheckInOn,
    this.isCheckOutOn,
    this.department,
    this.device,
    this.shiftType,
    this.accessPermissions,
    this.maintenanceObject,
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
  var offPerYear;
  var hoursPerDay;
  var hoursPerWeek;
  var address;
  var points;
  var consumeAnnualLeaves;
  var consumeCasualLeaves;
  var consumeSickLeaves;
  // var checkpointAccess;
  var role;
  var pin;
  var isCheckInOn;
  var isCheckOutOn;
  var department;
  var device;
  var shiftType;
  var accessPermissions;
  var maintenanceObject;
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
        offPerYear: json["off_per_year"],
        hoursPerDay: json["hours_per_day"],
        hoursPerWeek: json["hours_per_week"],
        address: json["address"],
        points: json["points"],
        consumeAnnualLeaves: json["consumeAnnualLeaves"],
        consumeCasualLeaves: json["consumeCasualLeaves"],
        consumeSickLeaves: json["consumeSickLeaves"],
        // checkpointAccess: json["checkpointAccess"],
        role: json["role"],
        pin: json["pin"],
        isCheckInOn: json["isCheckInOn"],
        isCheckOutOn: json["isCheckOutOn"],
        department: json["department"],
        device: Device.fromJson(json["device"]),
        shiftType: json["shift_type"],
        accessPermissions: List<AccessPermission>.from(
            json["accessPermissions"].map((x) => AccessPermission.fromJson(x))),
        maintenanceObject:
            MaintenanceObject.fromJson(json["maintenanceObject"]),
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
        "off_per_year": offPerYear,
        "hours_per_day": hoursPerDay,
        "hours_per_week": hoursPerWeek,
        "address": address,
        "points": points,
        "consumeAnnualLeaves": consumeAnnualLeaves,
        "consumeCasualLeaves": consumeCasualLeaves,
        "consumeSickLeaves": consumeSickLeaves,
        // "checkpointAccess": checkpointAccess,
        "role": role,
        "pin": pin,
        "isCheckInOn": isCheckInOn,
        "isCheckOutOn": isCheckOutOn,
        "department": department,
        "device": device.toJson(),
        "shift_type": shiftType,
        "accessPermissions":
            List<dynamic>.from(accessPermissions.map((x) => x.toJson())),
        "maintenanceObject": maintenanceObject.toJson(),
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

class AccessPermission {
  AccessPermission({
    this.category,
    this.permissions,
  });

  var category;
  var permissions;

  factory AccessPermission.fromJson(Map<String, dynamic> json) =>
      AccessPermission(
        category: json["Category"],
        permissions: List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Category": category,
        "permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
      };
}

class Permission {
  Permission({
    this.permissionSubType,
    this.view,
  });

  var permissionSubType;
  var view;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        permissionSubType: json["permissionSubType"],
        view: json["view"],
      );

  Map<String, dynamic> toJson() => {
        "permissionSubType": permissionSubType,
        "view": view,
      };
}

class Device {
  Device({
    this.token,
    this.ip,
    this.model,
    this.name,
  });

  var token;
  var ip;
  var model;
  var name;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        token: json["token"],
        ip: json["ip"],
        model: json["model"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "ip": ip,
        "model": model,
        "name": name,
      };
}

class MaintenanceObject {
  MaintenanceObject({
    this.title,
    this.remainingTime,
    this.message,
    this.underMaintenance,
  });

  var title;
  var remainingTime;
  var message;
  var underMaintenance;

  factory MaintenanceObject.fromJson(Map<String, dynamic> json) =>
      MaintenanceObject(
        title: json["title"],
        remainingTime: json["remainingTime"],
        message: json["message"],
        underMaintenance: json["underMaintenance"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "remainingTime": remainingTime,
        "message": message,
        "underMaintenance": underMaintenance,
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
    this.version,
    this.link,
    this.message,
    this.availableRelease,
    this.currentRelease,
    this.id,
    this.updateAvailability,
  });

  var version;
  var link;
  var message;
  var availableRelease;
  var currentRelease;
  var id;
  var updateAvailability;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        version: json["version"],
        link: json["link"],
        message: json["message"],
        availableRelease: json["availableRelease"],
        currentRelease: json["currentRelease"],
        id: json["_id"],
        updateAvailability: json["updateAvailability"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "link": link,
        "message": message,
        "availableRelease": availableRelease,
        "currentRelease": currentRelease,
        "_id": id,
        "updateAvailability": updateAvailability,
      };
}
