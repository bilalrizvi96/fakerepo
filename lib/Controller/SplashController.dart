import 'dart:async';
import 'dart:io';
import 'package:attendencesystem/API/API.dart';
import 'package:attendencesystem/API/BaseURl.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';

// import 'package:device_info_plus/device_info_plus.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'MaintenanceController.dart';

class SplashController extends GetxController {
  var updates = false.obs;
  var url = ''.obs;
  FirebaseMessaging? _firebaseMessaging;
  LocationPermission? permission;
  MaintenanceController _maintenanceController =
      Get.put(MaintenanceController());

  _registerOnFirebase() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging!.subscribeToTopic('all');
    await _firebaseMessaging!
        .getToken()
        .then((var token) => BaseUrl.fcm_token = token.toString());
    print(BaseUrl.fcm_token.toString());
  }

  void getMessage() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    print(settings);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        if (notification.title == 'Maintenance') {
          _maintenanceController.checkMaintenance();
        }
        Get.snackbar(" ${notification.title.toString()}",
            "${notification.body.toString()}");
      }

      print('Message clicked!');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print('Message clicked!');
      if (notification != null) {
        if (notification.title == 'Maintenance') {
          _maintenanceController.checkMaintenance();
        }
        Get.snackbar(
          " ${notification.title.toString()}",
          "${notification.body.toString()}",
        );
      }
    });
  }

  permissions() async {
    if (await Permission.location.request().isGranted) {
      update();
    } else {
      permissions();
      // Get.snackbar("Error ", 'Kindly grant the location permission!'.toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    if (await Permission.camera.request().isGranted) {
      update();
    } else {
      permissions();
      // Get.snackbar("Error ", 'Kindly grant the location permission!'.toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
    if (await Permission.storage.request().isGranted) {
      update();
    } else {
      permissions();
      // Get.snackbar("Error ", 'Kindly grant the location permission!'.toString(),
      //     colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    //
    super.onInit();
    this._registerOnFirebase();
    this.getMessage();
    if (Platform.isAndroid) {
      permissions();
    }
    checks();
  }

  // checkUpdate() async {
  //   var response = await API().CheckUpdate();
  //   if (response.statusCode == 200) {
  //     updates.value = response.data['response']['updateAvailability'];
  //     if (updates.value == true) {
  //       url.value = response.data['response']['link'];
  //       BaseUrl.url = url.value;
  //       // print(updateController.url);
  //     }
  //     checks();
  //   } else {
  //     Get.snackbar("Error ", response.data['error'].toString(),
  //         colorText: Colors.white, backgroundColor: Colors.red);
  //   }
  // }

  checks() {
    var tokenval = BaseUrl.storage.read("token");
    BaseUrl.storage1.read('seen') ?? false;
    print(tokenval);
    Future.delayed(new Duration(milliseconds: 700), () {
      // if (BaseUrl.storage.read('maintenance') == true) {
      //   Get.offAllNamed('/maintaince');
      // } else {
      if (tokenval != "out") {
        if (tokenval != null) {
          if (BaseUrl.storage.read('clockincheck') != DateTime.now().day) {
            BaseUrl.clockin = false;
          } else {
            BaseUrl.clockin = true;
          }
          if (BaseUrl.storage.read('clockoutcheck') != DateTime.now().day) {
            BaseUrl.clockout = false;
          } else {
            BaseUrl.clockout = true;
          }
          Get.offAllNamed('/home');
        } else if (BaseUrl.storage1.read('seen') == true) {
          Get.offAllNamed('/signinemp');
        } else {
          BaseUrl.storage1.write('seen', true);
          Get.offAllNamed('/intro');
        }
      } else if (BaseUrl.storage1.read('seen') == true) {
        Get.offAllNamed('/signinemp');
      } else {
        BaseUrl.storage1.write('seen', true);
        Get.offAllNamed('/intro');
      }
      // }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
